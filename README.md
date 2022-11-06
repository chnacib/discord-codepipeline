# AWS Codepipeline notification for Discord

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


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_sns"></a> [lambda\_sns](#module\_lambda\_sns) | ../ | n/a |


## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iam_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.basic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_layer_version.lambda_layer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [aws_lambda_permission.with_sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_sns_topic.topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.user_updates_sqs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | AWS Lambda function name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | Discord account token | `string` | n/a | yes |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | SNS Topic name | `string` | n/a | yes |
| <a name="input_url"></a> [url](#input\_url) | Discord Webhook URL | `string` | n/a | yes |

## Checking your discord chanel :) 

![image](https://user-images.githubusercontent.com/84737230/200148885-de9c6470-e5f4-47a9-b87e-5f26e543faec.png)
