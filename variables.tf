variable "vpc_id" {
    description = "Provide VPC ID where to deploy the server"
    type = string   
    default = "vpc-97518cf3" 
}

variable "my_ip" {
    description = "Provide your IP wih CIDR eg  80.116.247.32/32"
    type = string
    default = "80.116.247.32/32"   
}

variable "public_key" {
    description = "Provide pubblic key"
    type = string 
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDN0VkO0jxv9LfagkqyqUmgYIOSIYxeexUdKemEOAWuP3kewlZYhF72dR+r+AprS0VCJ1jBO2WAxpM42E+trf6OFZNcfVcfqL+hKnPEL6+5qj+asvm/bZpoQJtypHXXGXlPnh4fUfb4j3pqTva36KNjp62xKwJUlfVMa5TBAnAMnyXr+Nwa/6xHe2da0vadcSUiCXLHko7Bzp+0C+Luj72n+6ztTKhN2JUEIggB503g8T7xyYhI4NxqrQp4+MXGsIp9h5Ae1FLwstuc4pEFglkwerbBvW07O6b06A3wSu3+fODuk801ZKOxD7YeQu7Wi5Qn/UJkSpPZdiOpKbrSQCSU+/aL7xnvkSCgf6CW3lNZmzPmfLxi8fAkHxKmVjRRYADo0/peQ+hxUcY7omGqzDEJZ+iM/mIO+gGgrmnHG2OC1c35h+I2G2KDJSPYeExkuBitiKnMCWxiE3OiCNCEu4NRopWG0Cfco6bh9LsWNIkqoeUTPxAvvBk14vHmNNKz5TM= italy\\walpellegr@walpellegrw"

}

variable "instance_type" {
    description = "Provide instance type"
    type = string   
    default = "t2.micro"
}

variable "server_name" {
    description = "Provide server name"
    type = string
}   