terraform {
  required_version = "~> 1.11.0"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 1.0.0"
    }
  }
  backend "s3" {
    bucket       = "dev-kohta-terraform"
    region       = "ap-northeast-1"
    key          = "state/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}

provider "snowflake" {
  organization_name = var.SNOWFLAKE_ORGANIZATION
  account_name      = var.SNOWFLAKE_ACCOUNT
  user              = var.SNOWFLAKE_USER
  password          = var.SNOWFLAKE_PASSWORD
  role              = var.SNOWFLAKE_ROLE
}
