resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name  = "My-VPC"
    Owner = "Serg"
  }
}



#Public Subnet

resource "aws_subnet" "us-east-2a-public" {
  # count = "{lenght(var.azs)}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_cidr}"
  # cidr_block = "${element(var.subnet_cidr,count.index)}"

    availability_zone = "${data.aws_availability_zones.available.names[0]}"
  # availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name  = "My-Public-Subnet-A"
    Owner = "Serg"
  }
}

resource "aws_route_table" "us-east-2a-public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name  = "My-Route Table Public"
    Owner = "Serg"
  }
}

resource "aws_route_table_association" "us-east-2a-public" {
  subnet_id      = "${aws_subnet.us-east-2a-public.id}"
  route_table_id = "${aws_route_table.us-east-2a-public.id}"
}

resource "aws_subnet" "us-east-2b-privat" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.private_subnet_cidr}"

    availability_zone = "${data.aws_availability_zones.available.names[1]}"
  #  availability_zone = "us-east-2b"

  tags = {
    Name  = "My-Privat-Subnet-A"
    Owner = "Serg"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name  = "My-Internet-Gateway"
    Owner = "Serg"
  }
}

