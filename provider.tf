terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}
provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "myapp" {
    ami = "ami-0287a05f0ef0e9d9a"
    instance_type = "t2.micro"
    tags = {
        Name = "application server"
        Location = "bangalore"
        apptype = "webapp"
    }
  
}


