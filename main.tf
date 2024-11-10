# configured aws provider with proper credentials
provider "aws" {
  region  = "us-east-1"
  profile = "terraform-user"
}


# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {

  tags = {
    Name = "default vpc"
  }
}


# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


# create default subnet if one does not exit
resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name = "default subnet"
  }
}


# create security group for the ec2 instance
resource "aws_security_group" "ec2_security_group" {
  name        = "ec2 security group"
  description = "allow access on ports 80 and 22"
  vpc_id      = 

  ingress {
    description = "http access"
    from_port   = 
    to_port     = 
    protocol    = 
    cidr_blocks = 
  }

  ingress {
    description = "ssh access"
    from_port   = 
    to_port     = 
    protocol    = 
    cidr_blocks = 
  }

  egress {
    from_port   = 
    to_port     = 
    protocol    = 
    cidr_blocks = 
  }

  tags = {
    Name = "docker server sg"
  }
}

# launch the ec2 instance
resource "aws_instance" "ec2_instance" {
  ami                    = 
  instance_type          = 
  subnet_id              = 
  vpc_security_group_ids = 
  key_name               = 

  tags = {
    Name = "docker server"
  }
}


# an empty resource block
resource "null_resource" "name" {

  # ssh into the ec2 instance 
  connection {
    type        = 
    user        = 
    private_key = file()
    host        = 
  }
