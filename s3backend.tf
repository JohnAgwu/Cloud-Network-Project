terraform {
  backend "s3" {
    bucket = "jonag-terraform-store"
    key    = "network-project/terraform.tfstate"
    region = "eu-west-2"
  }
}