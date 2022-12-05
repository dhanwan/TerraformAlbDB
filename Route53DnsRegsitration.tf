resource "aws_route53_record" "www" {
  for_each = toset([var.apps_dns_name,var.app1_dns_name, var.app2_dns_name, var.home_dns_name])
  zone_id = data.aws_route53_zone.newzone.zone_id
  name    = each.key
  type    = "A"

  alias {
    name                   = module.alb.lb_dns_name
    zone_id                =  module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
