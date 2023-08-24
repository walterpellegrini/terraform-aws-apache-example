variable "vpc_id" {
    description = "Provide VPC ID where to deploy the server"
    type = string   
}

variable "my_ip" {
    description = "Provide your IP wih CIDR eg  80.116.247.32/32"
    type = string 
}

variable "public_key" {
    description = "Provide pubblic key"
    type = string 
}

variable "instance_type" {
    description = "Provide instance type"
    type = string   
}

variable "server_name" {
    description = "Provide server name"
    type = string
}   