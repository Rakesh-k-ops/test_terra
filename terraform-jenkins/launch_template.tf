resource "aws_launch_template" "jenkins_lt" {
  name_prefix   = "jenkins-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.jenkins_slave_sg.id] # Use the security group ID
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Jenkins-Slave"
    }
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk
              EOF
  )
}
