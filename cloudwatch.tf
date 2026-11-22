resource "aws_cloudwatch_dashboard" "dashboard" {

  dashboard_name = "ayush-project21-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              aws_instance.monitoring_server.id
            ]
          ]

          period = 300

          stat = "Average"

          region = "eu-west-1"

          title = "EC2 CPU Utilization"
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkIn",
              "InstanceId",
              aws_instance.monitoring_server.id
            ]
          ]

          period = 300

          stat = "Average"

          region = "eu-west-1"

          title = "Network In"
        }
      }
    ]
  })
}