module "lambda_sns" {
  source        = "../"
  region        = "us-east-1"
  account_id    = "01234567890"
  token         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  url           = "https://discord.com/api/v9/channels/xxxxxxxxxxxx/messages"
  function_name = "sample-function"
  topic_name = "sample-topic"  
}