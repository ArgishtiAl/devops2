provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main_vpc"
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_subnet"
  }
}


resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "main_internet_gateway"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "private_route_table"
  }
}


resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "main_nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "main_nat_gateway"
  }
}
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main_nat_gw.id
}
resource "aws_instance" "public_instance" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  tags = {
    Name = "PrivateInstance"
  }
}


