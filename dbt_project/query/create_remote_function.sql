CREATE FUNCTION `dev-project-kohta-401305`.`remote_function`.notify_to_slack(arg JSON) RETURNS INT64
REMOTE WITH CONNECTION `dev-project-kohta-401305`.`us-central1`.`cloud_run_function_con`
OPTIONS (
  endpoint = 'https://send-message-to-slack-1093141359435.us-central1.run.app'
)