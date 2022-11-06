# discord-codepipeline

## AWS Codepipeline notification for Discord

A discord notification triggered by codepipeline, using SNS and AWS Lambda.

## How to use this module

Clone this repo
```
git clone https://github.com/chnacib/discord-codepipeline.git
cd discord-codepipeline/module
```
## Requirements

* [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

Edit ``terrafile.tf`` and replace variables in module
```
module "lambda_sns" {
  source        = "../"
  region        = "us-east-1"
  account_id    = "01234567890"
  token         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  url           = "https://discord.com/api/v9/channels/xxxxxxxxxxxx/messages"
  function_name = "sample-function"
  topic_name = "sample-topic"  
}

```

Deploy

```
terraform init

terraform apply -auto-approve
```

## Create Codepipeline notification rule

click on "Create notification rule"

This application only supports some events, so mark the checkbox as this example

