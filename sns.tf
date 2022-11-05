resource "aws_sns_topic" "topic" {
  name = var.topic_name
  
}

resource "aws_sns_topic_policy" "topic_policy" {
  arn = aws_sns_topic.topic.arn
    policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": "__default_policy_ID",
    "Statement": [
      {
        "Sid": "__default_statement_ID",
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": [
          "SNS:GetTopicAttributes",
          "SNS:SetTopicAttributes",
          "SNS:AddPermission",
          "SNS:RemovePermission",
          "SNS:DeleteTopic",
          "SNS:Subscribe",
          "SNS:ListSubscriptionsByTopic",
          "SNS:Publish",
          "SNS:Receive"
        ],
        "Resource": "${aws_sns_topic.topic.arn}",
        "Condition": {
          "StringEquals": {
            "AWS:SourceOwner": "${var.account_id}"
          }
        }
      },
      {
        "Sid": "AWSCodeStarNotifications_publish",
        "Effect": "Allow",
        "Principal": {
          "Service": "codestar-notifications.amazonaws.com"
        },
        "Action": "SNS:Publish",
        "Resource": "${aws_sns_topic.topic.arn}",
        "Condition": {
          "StringEquals": {
            "aws:SourceAccount": "${var.account_id}"
          }
        }
      }
    ]
  }
EOF
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.main.arn
}
