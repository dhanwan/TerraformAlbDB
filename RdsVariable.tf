variable "db_name" {
    description = "AWS RDS Database Name"
    type = "string"
  
}

variable "db_instance_identifier" {
    type = "string"

  
}

variable "db_username" {
    description = "RDS Database Username"
    type    = "string"
  
}
variable "db_password" {
    description = "RDS Database Password"
    type    = "string"
    sensitive   = true
  
}

variable "rds_instance_class" {

    type    = "string"
    default = "db.t2.micro"
  
}
