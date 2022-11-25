resource "null_resource" "copy_ec2_key" {
    depends_on = [module.ec2-instance]

    connection {
      host = module.ec2-instance.public_ip
      type = "ssh"
      user = var.ec2_user
      password = ""
      private_key = file("privateKey/terraform.pem")

    }

    # File provisioner
    provisioner "file" {
      source = "privateKey/terraform.pem"
      destination = "/tmp/terraform.pem"
    }

    # Remote Provisioner

    provisioner "remote-exec" {
      inline = [
        "sudo apt-get update",
        "sudo apt-get upgrade -y",
        "sudo apt-get install apache2 -y",
      ]

      
    }
    
  
}