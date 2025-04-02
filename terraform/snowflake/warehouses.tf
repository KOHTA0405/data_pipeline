resource "snowflake_warehouse" "tf_demo" {
  name           = "TF_DEMO_WAREHOUSE"
  warehouse_size = "XSMALL"
  auto_suspend   = 60
}
