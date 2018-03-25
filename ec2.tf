provider "aws" {
  access_key = "AKIAI2A4KUQFPK42R25A"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_instance" "terraform" {
  ami           = "ami-84e3b2eb"
tags {
Name = "TERRA"
}
  instance_type = "t2.micro"
}
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
tags {
Name = "myvpc"
}
}

resource "aws_subnet" "web"{
vpc_id = "vpc-b1eb40d9"
cidr_block = "10.0.1.0/24"
tags {
Name = "web"
}
}
resource "aws_subnet" "application"{
vpc_id = "vpc-b1eb40d9"
cidr_block = "10.0.2.0/24"
tags {
Name = "application"
}
}

resource "aws_internet_gateway" "gw" {
vpc_id = "vpc-b1eb40d9"
tags {
Name = "gw"
}
}

resource "aws_route_table" "route" {
vpc_id = "vpc-b1eb40d9"
tags {
Name = "vpc_route"
}
}
resource "aws_route" "web" {
  route_table_id = "rtb-857411ed"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "igw-940e3efd"
 
}
resource "aws_security_group" "myvpc_SECGRP" {
vpc_id = "vpc-b1eb40d9"
tags {
Name = "Myvpc_security_group"
}
}
resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 23
  to_port         = 23
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  

  security_group_id = "sg-2647914d"
}




















































