resource "aws_vpc" "main" {
  cidr_block           = var.vpc-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC for Main Network"
  }
}

# we want to create subnets each in each availability Zone so lets get the availabilty zone details using data block

data "aws_availability_zones" "zones" {
  state = "available"
}
# Creating Public Subnets from Main VPC

resource "aws_subnet" "public-1" {
  cidr_block              = var.pusub-1
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[0]
  tags = {
    Name = "Public Subnet 1 for Main VPC"
  }
}


resource "aws_subnet" "public-2" {
  cidr_block              = var.pusub-2
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[1]
  tags = {
    Name = "Public Subnet 2 for Main VPC"
  }
}

resource "aws_subnet" "public-3" {
  cidr_block              = var.pusub-3
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[2]
  vpc_id                  = aws_vpc.main.id
  tags = {
    Name = "Public Subnet 3 for Main VPC"
  }
}

# lets create a Internet GW to route public subnets traffic to internet

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Internet GW for Public Access to Subnets"
  }
}

resource "aws_route_table" "igw-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.internet
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Route Table for IG"
  }
}
resource "aws_route_table_association" "igw-rt-a" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.igw-rt.id
}

resource "aws_route_table_association" "igw-rt-b" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.igw-rt.id
}

resource "aws_route_table_association" "igw-rt-c" {
  subnet_id      = aws_subnet.public-3.id
  route_table_id = aws_route_table.igw-rt.id
}

#creating private subnet to launch to instances 

resource "aws_subnet" "private-1" {
  cidr_block        = var.prisub-1
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.zones.names[0]
  tags = {
    Name = "Private Subnet 1 for Main VPC"
  }
}


resource "aws_subnet" "private-2" {
  cidr_block        = var.prisub-2
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.zones.names[1]
  tags = {
    Name = "Private Subnet 2 for Main VPC"
  }
}

resource "aws_subnet" "private-3" {
  cidr_block        = var.prisub-3
  availability_zone = data.aws_availability_zones.zones.names[2]
  vpc_id            = aws_vpc.main.id
  tags = {
    Name = "Private Subnet 3 for Main VPC"
  }
}


resource "aws_security_group" "web" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.internet]
    #ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.internet]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http_ssh"
  }
}