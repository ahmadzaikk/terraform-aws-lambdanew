resource "aws_lambda_function" "this" {
  count               = var.enabled ? 1 : 0
  filename            = var.filename
  source_code_hash    = var.source_code_hash
  function_name       = var.function_name
  role                = var.role
  handler             = var.handler
  runtime             = var.runtime
  timeout             = var.timeout
  description         = var.description
  tags                = var.tags
  publish             = var.publish  # This ensures that a version is created every time the function is updated
}

resource "aws_lambda_permission" "allow_events_bridge_to_run_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = join("", aws_lambda_function.this.*.function_name)
  principal     = "events.amazonaws.com"
}

resource "aws_lambda_function_version" "this" {
  count               = var.enabled ? 1 : 0
  function_name       = aws_lambda_function.this[0].function_name
  description         = "Version for ${aws_lambda_function.this[0].function_name}"
  source_code_hash    = aws_lambda_function.this[0].source_code_hash
}

