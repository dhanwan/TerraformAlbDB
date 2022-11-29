output "Ec2_public_ip" {
  value =  module.ec2-instance.public_dns
}

