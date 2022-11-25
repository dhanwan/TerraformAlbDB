locals {
  name = "${var.project_name}-${var.env}"
  common_tags = {
    CreatedBy = "Dhanwan Prajapati"
    Environment = var.env
    Project_Name = var.project_name
  }
}