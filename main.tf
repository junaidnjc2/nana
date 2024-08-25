provider "aws" {
  region = "us-east-2"
}

variable "vpc-cidr-block" {}
variable "subnet-cidr-block" {}
variable "cidr-blocks" {
  type = list(string)
}
variable "cidr-block-object" {
  type = list(object({
    cidr-block = string
    name = string
  }))
  
}
  
resource "aws_vpc" "development-vpc" {
  cidr_block = "50.0.0.0/16"

  tags = {
    Name: "musa-vpc"
  }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "50.0.10.0/24"
    availability_zone = "us-east-1a" 

    tags = {
      Name: "musa-subnet-1"
    }
}

output "dev-vpc" {
  value = aws_vpc.development-vpc.id
   
}

output "dev-subnet" {
  value = aws_subnet.dev-subnet-1.id
}
