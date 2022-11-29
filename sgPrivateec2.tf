module "sg_pri_http" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.0"

  name        = "${local.name}-private-http"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp", "https-443-tcp","ssh-tcp"]
     # Egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags

}