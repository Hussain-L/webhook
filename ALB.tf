module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"
  depends_on = [
    module.vpc
  ]
  name               = "Terraform-webserver-ALB"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.ALB-SG.id]

  target_groups = [
    {
      name      = "Terraform-ALB-TG"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
    }
  ]
}