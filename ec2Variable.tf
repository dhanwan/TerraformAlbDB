variable "instance_type" {
    default = "t2.micro"
  
}

variable "aws_key" {
    default = "terraform"
  
}
variable "ec2_user" {
    default = "ubuntu"
  
}

variable "instance_count" {
    type = number
    default = 2
  
}