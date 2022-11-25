module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  name = "web"

  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  key_name               = var.aws_key
  associate_public_ip_address = true 
#   monitoring             = true
  vpc_security_group_ids = [ module.sg_http.security_group_id]
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets_ids[0]

  tags = local.common_tags

}