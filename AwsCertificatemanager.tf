module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.2.0"

  domain_name  = var.domain_name
  zone_id      = data.aws_route53_zone.newzone.zone_id

  subject_alternative_names = [
    "*.mynewzone.co"
  ]

  wait_for_validation = true

  tags = local.common_tags
}

# Output For ACM Certificate ARn

output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}