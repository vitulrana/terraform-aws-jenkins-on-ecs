resource "aws_vpc" "jenkins" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
        Name = "Jenkins-VPC"
    }
}

resource "aws_internet_gateway" "jenkins-igw" {
    vpc_id = aws_vpc.jenkins.id

    tags = {
        Name = "Jenkins-IGW"
    }
}

resource "aws_default_route_table" "jenkins-default-route-table" {
    default_route_table_id = aws_vpc.jenkins.default_route_table_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.jenkins-igw.id
    }

    tags = {
        Name = "Jenkins-Default-Route-Table"
    }
}

resource "aws_subnet" "jenkins-pub-sn" {
    vpc_id     = aws_vpc.jenkins.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = var.subnet-az

    tags = {
        Name = "Jenkins-Pub-SN"
    }
}

resource "aws_default_security_group" "jenkins-default-sg" {
  vpc_id      = aws_vpc.jenkins.id

  ingress {
    description = "SSH Traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Jenkins SG"
  }
}