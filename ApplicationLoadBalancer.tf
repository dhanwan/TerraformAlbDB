module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "${local.name}-alb"

  load_balancer_type = var.load_balancer_type 

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets_ids
  security_groups    = [module.sg_alb.security_group_id]


  target_groups = [
    {
      name_prefix          = var.tg_name_prefix
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = var.health_check_enabled
        interval            = 30
        path                = var.health_check_path
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        my_app1 = {
          target_id = module.ec2-private["one"].id
          port      = 80
        },
        my_app2 = {
          target_id = module.ec2-private["two"].id
          port = 80
        }
      }
      tags = local.common_tags
    }
  ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}
