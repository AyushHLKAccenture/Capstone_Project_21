resource "aws_security_group" "ec2_sg" {

  name = "ayush-p21-sg"

  vpc_id = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "monitoring_server" {

  ami           = data.aws_ami.al2023.id
  instance_type = "t3.micro"

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  iam_instance_profile = aws_iam_instance_profile.cw_profile.name

  user_data = <<EOF
#!/bin/bash

yum install -y amazon-cloudwatch-agent
EOF

  tags = {
    Name = "ayush-p21-monitoring-server"
  }
}