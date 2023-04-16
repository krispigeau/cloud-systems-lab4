# Backend for Terraform Cloud

terraform {
  cloud {
    organization = "KrisCo"

    workspaces {
      name = "lab4"
    }
  }
}
