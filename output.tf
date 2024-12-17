output "function_arn" {
  value = join("", aws_lambda_function.this.*.arn)
}
output "function_name" {
  description = "The name of the Lambda function"
  value       = join("", aws_lambda_function.this.*.function_name)
}

output "lambda_publish" {
  value = aws_lambda_function.this[0].publish
  description = "Indicates whether the Lambda function is published"
}


output "lambda_function_arn_version" {
  value = "${aws_lambda_function.this[0].arn}:${aws_lambda_function.this[0].version}"
  description = "The ARN of the Lambda function with version"
}
