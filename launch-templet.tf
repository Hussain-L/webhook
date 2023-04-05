resource "aws_launch_template" "terraform-webserver-lt" {
  depends_on = [
    module.vpc
  ]
  name                   = var.lt_name
  image_id               = var.ami_id
  update_default_version = true
  instance_type          = "t2.micro"
  key_name               = "oregon"
  user_data              = filebase64("${path.module}/userdata.sh")
  # security_groups = [aws_security_group.lt-sg.id]
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.lt-sg.id]
  }
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 10
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name" = "terraform-webserver"
    }
  }
}