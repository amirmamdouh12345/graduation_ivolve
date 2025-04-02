resource "aws_cloudwatch_log_group" "ec2_log_group" {
    name  = "/aws/terraform/logs"
    retention_in_days = 7
}


resource "aws_cloudwatch_log_stream" "ec2_log_stream" {
  name           = "example-stream"
  log_group_name = aws_cloudwatch_log_group.ec2_log_group.name
}

##Alert 

resource "aws_cloudwatch_metric_alarm" "cpu_alarm1" {

    alarm_name = "high-cpu-utilization"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = 2
    metric_name = "CPUUtilization"
    namespace          = "AWS/EC2"
    period             = 60
    statistic          = "Average"
    threshold          = 80
    alarm_description  = "Triggers when CPU utilization is >= 80% for 2 minutes"
    alarm_actions      = [aws_sns_topic.alerts.arn]
    dimensions = {
    InstanceId = module.ec2_1.id
    }
}


resource "aws_cloudwatch_metric_alarm" "cpu_alarm2" {

    alarm_name = "high-cpu-utilization"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = 2
    metric_name = "CPUUtilization"
    namespace          = "AWS/EC2"
    period             = 60
    statistic          = "Average"
    threshold          = 80
    alarm_description  = "Triggers when CPU utilization is >= 80% for 2 minutes"
    alarm_actions      = [aws_sns_topic.alerts.arn]
    dimensions = {
    InstanceId = module.ec2_2.id
    }
}

resource "aws_sns_topic" "alerts" {
  name = "cloudwatch-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "amir.mam.alx@gmail.com" 
}