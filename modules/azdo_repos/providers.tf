terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }
  }
}
provider "azuredevops" {
  org_service_url = "https://kdizzle.visualstudio.com/"

}


data "azuredevops_project" "project" {
  name = var.project

}

data "azuredevops_group" "contributer" {
  project_id = data.azuredevops_project.project.id
  name = "contributors"
}