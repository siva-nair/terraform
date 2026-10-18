resource "aws_cloudwatch_log_group" "flow_logs" {
  name              = "/aws/vpc/flowlogs"
  retention_in_days = 30
}

resource "aws_flow_log" "this" {
  iam_role_arn         = var.iam_role_arn
  log_destination      = aws_cloudwatch_log_group.flow_logs.arn
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
  log_destination_type = "cloud-watch-logs"
}
