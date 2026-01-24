# dbt
ナレッジの蓄積とパッケージ検証等で使用するリポジトリ

## dbt-osmosis
* seedsのデータをsourceとして扱う場合は、osmosisの設定をseedsにも記載しないとエラーとなる
  * [参考](https://z3z1ma.github.io/dbt-osmosis/docs/intro#configure-dbt-osmosis)

## elementary
* elementaryパッケージとCLIのインストールおよびprofilesの設定
  * profilesに、"elementary"が必要
  * `edr report`コマンドをするときは、profilesの指定が必要(例. `edr report --profiles-dir .`)
  * [参考](https://docs.elementary-data.com/oss/guides/generate-report-ui#install-cli)