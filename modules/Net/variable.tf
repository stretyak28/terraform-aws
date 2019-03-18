#variable "aws_key_path" {}
#variable "aws_key_name" {}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "us-east-2"
}


data "aws_availability_zones" "available" {
    state = "available"
}


/*
variable "amis" {
    description = "AMIs by region"
    default = {
        us-east-2 = "ami-02e1499f8253f416f" # ubuntu 18.04 LTS
    }
}
*/

variable "vpc_cidr" {}

variable "public_subnet_cidr" {}

variable "private_subnet_cidr" {}

/*
variable "subnet_cidr" {
  type = "list"
  default = ["10.0.10.0/24","10.0.20.0/24,"10.0.30.0/24"] 
}
*/

