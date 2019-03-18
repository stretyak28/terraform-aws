module "network" {
  source              = "/modules/Net"

  vpc_cidr            = "${var.vpc_cidr}"
  public_subnet_cidr  = "${var.public_subnet_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  
}

module "Web-servers" {
  source            = "/modules/Web"
}
