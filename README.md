# ERD Generator

ERD GeneratorはPostgreSQLデータベースのスキーマをER図（Entity-Relationship Diagram）として可視化するツールです。`pg_dump`を使用してデータベーススキーマ情報を抽出し、`@liam-hq/cli`を使用してビジュアルなERDを生成します。

## 必要な環境

- Node.jsとnpm
- PostgreSQLクライアントツール（pg_dump）
- PostgreSQLデータベース

### pg_dumpのインストール方法（Mac）

#### 方法1：Homebrewを使う（推奨）

1. PostgreSQLクライアントツールをインストール：

```bash
brew install libpq
```

2. パスを通す（Apple Siliconの場合）：

```bash
echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Intel Macの場合は `/usr/local/opt/libpq/bin` を使用してください。

3. インストール確認：

```bash
pg_dump --version
```

#### 方法2：Postgres.appを使う

1. [Postgres.app](https://postgresapp.com/)をダウンロードしてインストール
2. パスを通す：

```bash
sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
```

3. ターミナルを再起動後、動作確認：

```bash
pg_dump --version
```

## セットアップ

1. 設定ファイルを初期化します：

```bash
make init
```

2. `db.config.yml`を編集してPostgreSQLの接続情報を設定します：

```yaml
db_uri: postgres://username:password@hostname:5432/dbname
```

## 使い方

### ERDの生成

データベーススキーマダンプを生成してERDを作成します：

```bash
make generate
```

このコマンドは以下を実行します：

1. `pg_dump`を使用してデータベーススキーマを抽出
2. Liam ERDを使用してインタラクティブなERDを生成

### ERDの表示

Webサーバーを起動してERDを表示します：

```bash
make serve
```

その後、ブラウザを開いて表示されたURLにアクセスしてください。

### クリーンアップ

生成されたファイルを削除します：

```bash
make clean
```

## 設定

データベース接続は`db.config.yml`で設定します。設定ファイルは以下の構造のYAML形式を使用します：

```yaml
db_uri: postgres://username:password@hostname:port/database_name
```

設定ファイルの例は`db.config.yml.example`に提供されています。
