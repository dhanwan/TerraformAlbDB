module "rds_sg" {
   source  = "terraform-aws-modules/security-group/aws"
   version = "4.16.0"

  name        = "${local.name}-rds"
  description = "Security group for rds with mysql ports open within VPC"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["mysql-tcp"]
  
}