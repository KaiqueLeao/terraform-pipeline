# create a vpc
resource "aws_vpc" "vpc-pipeline" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main"
  }
}

# Subnets
resource "aws_subnet" "main-public" {
  vpc_id                  = aws_vpc.vpc-pipeline.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "sa-east-1a"

  tags = {
    Name = "main-public"
  }
}

// create routing table which points to the internet gateway
resource "aws_route_table" "jenkins-route" {
  vpc_id = aws_vpc.vpc-pipeline.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-jenkins.id
  }
 
  tags = {
    Name = "gw-jenkins"
  }
}

// associate the routing table with the subnet
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.main-public.id
  route_table_id = aws_route_table.jenkins-route.id
}