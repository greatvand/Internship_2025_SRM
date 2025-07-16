variable "region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
  
}

variable "vpcName" {
  description = "The name of the VPC."
  type        = string
  default    = "dev-vpc-01"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidrs" {
  description = "List of CIDR blocks for the VPC."
  type        = list(string)
  default     = ["10.0.0.0/16", "192.168.0.0/16"]

}

variable "instance_details" {
  description = "Details of the EC2 instances to be created."
  type = object({
    name = string
    size = string
    ami = string
  })
  default = {
    name = "ec2-instance-01"
    size = "t3.nano"
    ami = "ami-0150ccaf51ab55a51" # Example AMI ID, replace with a valid one for your region
  }
}

variable "env_instance_details" {
  description = "Details of the EC2 instances to be created in the environment."
  type = map(object({
    name = string
    size = string
    ami = string
  }))
  default = {
    "dev" = {
      name = "ec2-instance-dev"
      size = "t3.nano"
      ami = "ami-0150ccaf51ab55a51"
    }
    "prod" = {
      name = "ec2-instance-prod"
      size = "t3.micro"
      ami = "ami-0150ccaf51ab55a51"
    }
  }
}