locals {
  multiple_instance = {
    one = {
        subnet_id = data.terraform_remote_state.vpc.outputs.private_subntes_ids[0]
  }

    two = {
        subnet_id = data.terraform_remote_state.vpc.outputs.private_subntes_ids[1]

  }
}
}