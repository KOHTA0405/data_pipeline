resource "snowflake_account_role" "dbt_admin_role" {
  name = "TF_DEMO_DBT_ADMIN_ROLE"
}

# resource "snowflake_account_role" "writer_role" {
#   name = "TF_DEMO_WRITER_ROLE"
# }

# resource "snowflake_account_role" "creater_role" {
#   name = "TF_DEMO_CREATER_ROLE"
# }

# resource "snowflake_account_role" "reader_role" {
#   name = "TF_DEMO_READER_ROLE"
# }

# resource "snowflake_grant_account_role" "writer_role_grant" {
#   role_name        = snowflake_account_role.writer_role.name
#   parent_role_name = snowflake_account_role.dbt_admin_role.name
# }

# resource "snowflake_grant_account_role" "creater_role_grant" {
#   role_name        = snowflake_account_role.creater_role.name
#   parent_role_name = snowflake_account_role.dbt_admin_role.name
# }

# resource "snowflake_grant_account_role" "reader_role_grant" {
#   role_name        = snowflake_account_role.reader_role.name
#   parent_role_name = snowflake_account_role.dbt_admin_role.name

# }

resource "snowflake_grant_account_role" "sysadmin_role_grant" {
  role_name        = snowflake_account_role.dbt_admin_role.name
  parent_role_name = "SYSADMIN"
}
