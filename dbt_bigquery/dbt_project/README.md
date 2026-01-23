Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

### 環境変数の設定

このプロジェクトでは、BigQueryへの認証に環境変数を使用します。

#### ローカル環境での設定

開発環境用:
```bash
export GOOGLE_APPLICATION_CREDENTIALS=/Users/kohta/.key/gcp/dev-service-account-dbt.json
```

本番環境用:
```bash
export GOOGLE_APPLICATION_CREDENTIALS=/Users/kohta/.key/gcp/prd-service-account-dbt.json
```

#### CI環境（GitHub Actions、Lightdash等）での設定

環境変数`BIGQUERY_KEYFILE_JSON`にサービスアカウントキーのJSON文字列を設定してください。

例（GitHub Secrets）:
- `BIGQUERY_KEYFILE_JSON`: サービスアカウントキーファイルのJSON内容をそのまま設定

例（Lightdash）:
- Lightdashの設定画面で、環境変数`BIGQUERY_KEYFILE_JSON`を設定
- または、`GOOGLE_APPLICATION_CREDENTIALS`環境変数にサービスアカウントキーファイルのパスを設定

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
