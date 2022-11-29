variable "load_balancer_type " {
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