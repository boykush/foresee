# Terraform Configuration

ForeseeプロジェクトのGCPインフラストラクチャをTerraformで管理します。

## ディレクトリ構成

```
terraform/
├── environments/
│   └── prod/          # 本番環境の設定
│       ├── versions.tf    # Terraformバージョンとbackend設定
│       ├── provider.tf    # GCPプロバイダー設定
│       ├── variables.tf   # 変数定義
│       └── main.tf        # リソース定義
└── modules/           # 再利用可能なモジュール（今後追加予定）
```

## セットアップ

### 1. GCP認証

```bash
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
```

### 2. 環境変数の設定

`.mise.local.toml`を作成し、プロジェクトIDを設定します:

```toml
[env]
TF_VAR_project_id = "YOUR_PROJECT_ID"
```

**注意**: `.mise.local.toml`は`.gitignore`に含まれており、Gitにコミットされません。

### 3. Terraform の初期化

```bash
cd terraform/environments/prod
mise exec -- terraform init
```

## 使い方

### mise タスク経由（推奨）

```bash
# Plan の実行
mise run tf:plan
```

### 直接実行

```bash
cd terraform/environments/prod

# Plan
mise exec -- terraform plan

# Apply
mise exec -- terraform apply
```

**重要**: `mise exec`経由で実行することで、`.mise.local.toml`の環境変数が自動的に読み込まれます。
