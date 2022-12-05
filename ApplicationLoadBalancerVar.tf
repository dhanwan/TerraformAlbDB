variable "load_balancer_type" {
    default = "application"
  
}

variable "tg_name_prefix" {
    default = "apps"
  
}

variable "health_check_enabled" {
    type = bool 
    default = true 
  
}

variable "health_check_path" {

    default = "/"
  
}

variable "app1_dns_name" {
    default = "app1.mynewzone.co"
  
}

variable "app2_dns_name" {
    default = "app2.mynewzone.co"
  
}

variable "home_dns_name" {
    default = "web.mynewzone.co"
  
}