#Creamos el VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.block-vpc
  tags = {
    Name = "ob-vpc"
  }
}

#Creamos las Subnets

resource "aws_subnet" "sub-1a" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.block-a
  availability_zone       = var.zona-a
  map_public_ip_on_launch = var.ip-publica
  tags = {
    Name = "ob-sub-1"
  }
}

resource "aws_subnet" "sub-1b" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.block-b
  availability_zone       = var.zona-b
  map_public_ip_on_launch = var.ip-publica
  tags = {
    Name = "ob-sub-2"
  }
}

resource "aws_subnet" "sub-1c" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.block-c
  availability_zone       = var.zona-c
  map_public_ip_on_launch = true
  tags = {
    Name = "ob-sub-3"
  }
}

resource "aws_subnet" "sub-1d" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.block-d
  availability_zone       = var.zona-d
  map_public_ip_on_launch = true
  tags = {
    Name = "ob-sub-4"
  }
}

#Creamos un Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "ob-gw-a"
  }
}


#Creamos un NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc = true
 depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
   subnet_id	= aws_subnet.sub-1c.id
  depends_on    = [aws_internet_gateway.gw]
    tags = {
    Name = "eks-nat-gw-private-ab"
  }
 }

#Creamos las Route Tables

resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "ob-route-table-publica"
  }
}

resource "aws_route_table" "privada" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "ob-route-table-private"
  }
}


#Creamos las asociaciones de las rutas

resource "aws_route_table_association" "privada-a" {
  subnet_id      = aws_subnet.sub-1a.id
  route_table_id = aws_route_table.privada.id
}

resource "aws_route_table_association" "privada-b" {
  subnet_id      = aws_subnet.sub-1b.id
  route_table_id = aws_route_table.privada.id
}

resource "aws_route_table_association" "publica-c" {
  subnet_id      = aws_subnet.sub-1c.id
  route_table_id = aws_route_table.publica.id
}

resource "aws_route_table_association" "publica-d" {
  subnet_id      = aws_subnet.sub-1d.id
  route_table_id = aws_route_table.publica.id
}

