output "instance_id" {
  value = aws_instance.monitoring_server.id
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.dashboard.dashboard_name
}