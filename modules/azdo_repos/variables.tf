variable "project" {
  type        = string
  description = "Name of the project"
}

variable "repos" {
  type = map(object({
     min_reviewer = number
  }))
  description = "Repos and configuration"
}
