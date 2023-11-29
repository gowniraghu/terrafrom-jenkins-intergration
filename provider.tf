terraform {
  required_providers {
    aws = {
        source = "registry.terraform.io/hashicorp/aws"
    }
  }
}
provider "aws" {
    profile = "default"
    region = "ap-south-a"
  
}

resource "aws_instance" "myapp" {
    ami = "ami-0287a05f0ef0e9d9a"
    instance_type = "t2.micor"
    tags = {
        Name = "application server"
        Location = "bangalore"
        apptype = "webapp"
    }
  
}


