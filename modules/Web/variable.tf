variable "region" {
  description = "The region to deploy the VPC in, e.g: us-east-2."
  type = "string"
  default = "us-east-2"
}

variable "instance_size" {
  description = "The size of the cluster nodes, e.g: t2.medium."
  type = "string"
  default = "t2.micro"
}

variable "web_server_count" {
  description = "The number of web servers to run"
  type = "string"
  default = "1"
}

variable "public_key_path" {
  description = "The local public key path, e.g. ~/.ssh/id_rsa.pub"
  type = "string"
  default = "D:/AWS/SSH-KEY/serg-key-oregon.pem"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}
