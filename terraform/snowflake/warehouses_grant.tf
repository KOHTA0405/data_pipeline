resource "snowflake_grant_privileges_to_account_role" "tf_demo_warehouse_grant" {
  account_role_name = snowflake_account_role.dbt_admin_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.tf_demo.name
  }
  all_privileges    = true
  with_grant_option = true
}
