module "sg_http" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.0"

  name        = "${local.name}-http"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp", "https-443-tcp"]
  ingress_with_cidr_blocks = [ 
    {
        rule    = "ssh-tcp"
        cidr_blocks = "103.180.81.194/32"
    }
   ]


  # Egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}

module "sg_alb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.0"

  name        = "${local.name}-alb"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp", "https-443-tcp"]





  # Egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}


