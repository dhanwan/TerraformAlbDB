module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "${local.name}-alb"

  load_balancer_type = "application"

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets_ids
  security_groups    = [module.sg_alb.security_group_id]


  target_groups = [
    {
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = module.ec2-instance.id
          port = 80
        }
        # my_other_target = {
        #   target_id = "i-a1b2c3d4e5f6g7h8i"
        #   port = 8080
        # }
      }
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
