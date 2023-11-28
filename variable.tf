variable "instance_type" {
    description = "type of the instance"
    type = "string"
    default = "t2.micro"
  
}

variable "ami_id" {
    description = "id of the ec2 ami"
    type = "string"
    default = "ami-0287a05f0ef0e9d9a"
  
}


variable "instance_name" {
    description = "name of the instance"
    type = "string"
    default = "app-server"
    
  
}