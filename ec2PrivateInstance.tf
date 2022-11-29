module "ec2-private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

for_each = {
    "one" = data.terraform_remote_state.vpc.outputs.private_subntes_ids[0],
    "two" = data.terraform_remote_state.vpc.outputs.private_subntes_ids[1]
}

  name = "web-${each.key}"

  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  key_name               = var.aws_key
  associate_public_ip_address = false 
  # availability_zone = each.key
#   monitoring             = true
  vpc_security_group_ids = [ module.sg_pri_http.security_group_id]
  subnet_id             = each.value

  user_data = file("${path.module}/apps.sh")

  tags = local.common_tags

}