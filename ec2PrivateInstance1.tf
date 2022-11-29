module "ec2-private-app1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  for_each = local.multiple_instance

  name = "app1-${each.key}"

  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  key_name               = var.aws_key
  associate_public_ip_address = false 
  # availability_zone = each.key
#   monitoring             = true
  vpc_security_group_ids = [ module.sg_pri_http.security_group_id]
  subnet_id            = each.value.subnet_id

  user_data = file("${path.module}/app1.sh")

  tags = local.common_tags

}