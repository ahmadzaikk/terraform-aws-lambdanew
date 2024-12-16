output "function_arn" {
  value = join("", aws_lambda_function.this.*.arn)
}
output "function_name" {
  description = "The name of the Lambda function"
  value       = join("", aws_lambda_function.this.*.function_name)
}
