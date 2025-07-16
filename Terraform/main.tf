terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpcName
  }
}

resource "aws_vpc" "example_multiple_vpcs" {
  count = length(var.vpc_cidrs)

  cidr_block = var.vpc_cidrs[count.index]
  tags = {
    Name = "${var.vpcName}-${count.index + 1}"
  }
}

# resource "aws_instance" "ec2_instance" {
#   ami           = var.instance_details.ami
#   instance_type = var.instance_details.size
#   tags = {
#     Name = var.instance_details.name
#   }
# }

# resource "aws_instance" "env_ec2_instances" {
#   for_each = var.env_instance_details

#   ami           = each.value.ami
#   instance_type = each.value.size
#   tags = {
#     Name = each.value.name
#   }
  
# }

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
}