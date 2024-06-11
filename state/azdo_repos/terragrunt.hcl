terraform  {
    source = "../../modules/azdo_repos"
}
locals {
    data = yamldecode(file("../../resources/azdo_repos/env-${get_env("TF_VAR_env")}.yml"))
}

inputs = {
    project = local.data.project
    repos = local.data.repos
}