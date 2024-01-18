locals {
  location  = "westeurope"
  loc_short = "weu"
  tags = {
    env     = var.environment
    project = data.terraform_remote_state.azure.outputs.project_name
  }
  resource_prefix = "${local.tags.project}-${local.loc_short}-${local.tags.env}"
}