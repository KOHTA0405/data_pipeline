-- モデルの依存関係テーブルから、各モデルの下流モデルを抽出するクエリ
-- parent_modelsは文字列、null、または配列形式（JSON文字列）で保存されている可能性がある
-- 
-- 使用方法: 最初のWITH句のmodel_dependenciesを実際のテーブル名に置き換えてください
-- 例: WITH RECURSIVE model_dependencies AS (SELECT model, parent_models FROM your_table_name)

WITH RECURSIVE model_dependencies AS (
  -- 元のテーブルを想定（実際のテーブル名に置き換えてください）
  -- ここでは例として、WITH句でデータを定義しています
  SELECT * FROM (
    SELECT 'stg_A' AS model, CAST(NULL AS STRING) AS parent_models
    UNION ALL SELECT 'stg_B', CAST(NULL AS STRING)
    UNION ALL SELECT 'int_A', 'stg_A'
    UNION ALL SELECT 'fct_A', '["int_A","stg_B"]'
    UNION ALL SELECT 'dim_B', 'stg_B'
  )
),

-- parent_modelsを正規化（配列を展開）
normalized_deps AS (
  SELECT 
    model,
    TRIM(parent_model) AS parent_model
  FROM model_dependencies,
  UNNEST(
    CASE 
      -- nullの場合
      WHEN parent_models IS NULL THEN []
      -- JSON配列形式の場合（["model1","model2"]）
      WHEN parent_models LIKE '[%' THEN 
        ARRAY(
          SELECT JSON_EXTRACT_SCALAR(parent_model_json, '$')
          FROM UNNEST(JSON_EXTRACT_ARRAY(parent_models)) AS parent_model_json
        )
      -- 単一の文字列の場合
      ELSE [parent_models]
    END
  ) AS parent_model
),

-- 再帰CTEで下流モデルを探索
-- 各レベルで、親モデルから子モデルへの関係を追跡
recursive_downstream AS (
  -- ベースケース: 直接の下流モデル（1レベル下）
  SELECT 
    parent_model AS model,
    model AS downstream_model,
    1 AS level
  FROM normalized_deps
  WHERE parent_model IS NOT NULL
  
  UNION ALL
  
  -- 再帰ケース: 間接的な下流モデル（複数レベル下）
  SELECT 
    r.model,
    n.model AS downstream_model,
    r.level + 1 AS level
  FROM recursive_downstream r
  INNER JOIN normalized_deps n
    ON r.downstream_model = n.parent_model
  WHERE n.parent_model IS NOT NULL
),

-- 各モデルの最終的な下流モデルを集約（重複を除去）
downstream_models AS (
  SELECT DISTINCT
    model,
    downstream_model
  FROM recursive_downstream
),

-- 全てのモデルを取得し、下流モデルがある場合はそれらを結合
-- 下流モデルがないモデルはnullとして1行で表示
all_models_with_downstream AS (
  -- 下流モデルがあるモデル
  SELECT 
    model,
    downstream_model
  FROM downstream_models
  
  UNION ALL
  
  -- 下流モデルがないモデル（nullとして表示）
  SELECT 
    md.model,
    CAST(NULL AS STRING) AS downstream_model
  FROM model_dependencies md
  WHERE md.model NOT IN (
    SELECT DISTINCT model 
    FROM downstream_models
  )
)

-- 最終結果を出力
SELECT 
  model,
  downstream_model
FROM all_models_with_downstream
ORDER BY model, downstream_model;

