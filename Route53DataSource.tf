data "aws_route53_zone" "newzone" {
    name = var.domain_name
  
}

# mynewzone.com id

output "domain_zone_id" {
    value = data.aws_route53_zone.newzone.zone_id
  
}
