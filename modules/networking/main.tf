############################################
# VPC
############################################
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-vpc"
  }
}

############################################
# INTERNET GATEWAY
############################################

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"
  }
}

############################################
# PUBLIC SUBNETS
############################################

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.pub_sub1
  availability_zone       = var.pub_availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.pub_sub2
  availability_zone       = var.pub_availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

############################################
# PRIVATE SUBNETS
############################################

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.priv_sub1
  availability_zone = var.priv_availability_zone1

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.priv_sub2
  availability_zone = var.priv_availability_zone2

  tags = {
    Name = "private-subnet-2"
  }
}

############################################
# PUBLIC ROUTE TABLE
############################################

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

############################################
# PUBLIC ROUTE TABLE ASSOCIATIONS
############################################

resource "aws_route_table_association" "public_rta1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rta2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

############################################
# ELASTIC IPS
############################################

resource "aws_eip" "eip1" {
  domain = "vpc"

  tags = {
    Name = "eip-1"
  }
}

resource "aws_eip" "eip2" {
  domain = "vpc"

  tags = {
    Name = "eip-2"
  }
}

############################################
# NAT GATEWAYS
############################################

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet1.id

  depends_on = [aws_internet_gateway.my_igw]

  tags = {
    Name = "nat-gateway-1"
  }
}

resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public_subnet2.id

  depends_on = [aws_internet_gateway.my_igw]

  tags = {
    Name = "nat-gateway-2"
  }
}

############################################
# PRIVATE ROUTE TABLES
############################################

resource "aws_route_table" "private_rt1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw1.id
  }

  tags = {
    Name = "private-route-table-1"
  }
}

resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw2.id
  }

  tags = {
    Name = "private-route-table-2"
  }
}

############################################
# PRIVATE ROUTE TABLE ASSOCIATIONS
############################################

resource "aws_route_table_association" "private_rta1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt1.id
}

resource "aws_route_table_association" "private_rta2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt2.id
}
