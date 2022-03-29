terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "salomon"

    workspaces {
      name = "devops-rampup-second-part"
    }
  }
}
