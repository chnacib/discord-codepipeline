module "lambda_sns" {
  source        = "github.com/chnacib/discord-codepipeline"
  region        = "us-east-1"
  account_id    = "01234567890"
  token         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  url           = "https://discord.com/api/v9/channels/xxxxxxxxxxxx/messages"
  function_name = "aaaaaaaa"
  topic_name = "aaaaaaaaa"  
  filename_fuction = "https://github.com/chnacib/discord-codepipeline/blob/main/lambda_package.zip"
  filename_layer = "https://github.com/chnacib/discord-codepipeline/blob/main/layer.zip"
  #filename_fuction = "${path.module}/lambda_package.zip"
  #filename_layer = "${path.module}/layer.zip"
}