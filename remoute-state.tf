terraform {
  backend "s3" {
    bucket = "terraform-state-tretyak"
    key    = "tfstate/main.tfstate"
    region = "us-east-2"
  }
}