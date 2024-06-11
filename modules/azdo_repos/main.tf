
resource "azuredevops_git_repository" "repo" {
  for_each = var.repos
  project_id = data.azuredevops_project.project.id
  name       = each.key
  initialization {
    init_type = "Clean"
  }
}
resource "azuredevops_git_permissions" "deny_branch" {
  for_each = var.repos
  project_id = data.azuredevops_project.project.id
  repository_id = azuredevops_git_repository.repo[each.key].id
  principal  = data.azuredevops_group.contributer.id

  permissions = {
    CreateBranch = "deny"
  }
}
resource "azuredevops_git_permissions" "allow_default_branch" {
  for_each = var.repos
  project_id = data.azuredevops_project.project.id
  principal  = data.azuredevops_group.contributer.id
  repository_id = azuredevops_git_repository.repo[each.key].id
  branch_name = "feature"
  permissions = {
    CreateBranch = "allow"
  }
}