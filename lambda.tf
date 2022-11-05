resource "aws_iam_role" "iam_for_lambda" {
  name = "role-${var.function_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.iam_for_lambda.name
}



resource "aws_lambda_function" "main" {
  filename      = "lambda_package.zip"
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  layers = [aws_lambda_layer_version.lambda_layer.arn]

  runtime = "python3.9"

  environment {
    variables = {
      TOKEN = var.token
      URL_DISC = var.url
    }
  }
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "layer.zip"
  layer_name = "layer-requests"

  compatible_runtimes = ["python3.9"]
}

resource "aws_lambda_permission" "with_sns" {
    statement_id = "AllowExecutionFromSNS"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.main.function_name
    principal = "sns.amazonaws.com"
    source_arn = aws_sns_topic.topic.arn
}