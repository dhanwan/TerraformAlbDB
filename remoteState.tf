data "terraform_remote_state" "vpc" {
    backend = "local"

    config = {
      path = "../Terraform/vpc/terraform.tfstate"
     }
  
}