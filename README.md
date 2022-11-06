# discord-codepipeline

## AWS Codepipeline notification for Discord

A discord notification triggered by codepipeline, using SNS and AWS Lambda.

## Requirements

* [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## How to get Discord token and webhook

Follow this tutorial to get Discord Token: [link](https://linuxhint.com/get-discord-token/) 
Follow this tutorial to get Discord Webhook url: [link](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)


## How to use this module

Clone this repo
```
git clone https://github.com/chnacib/discord-codepipeline.git
cd discord-codepipeline/module
```

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

#### click on "Create notification rule"

![image](https://user-images.githubusercontent.com/84737230/200147969-8658bcfb-2bf8-4d79-be37-d847d6ccc92e.png)

#### This application only supports some events, so mark the checkbox as this example

![image](https://user-images.githubusercontent.com/84737230/200148000-10dcd6ef-513b-446d-96bf-f683c859081d.png)


