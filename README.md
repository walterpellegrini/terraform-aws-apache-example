Terraform module to provision an EC2 instance running with Http
Not intended for production use

```hcl
terraform {

}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

module "apache" {
  source        = ".//terraform-aws-apache-example"
  server_name   = "mio_apache"
  instance_type = "t2.micro"
  public_key    = "ssh-rsa AAAA..."
  vpc_id        = "vpc-000000"
  my_ip         = "1.1.1.1"
}

output "ip_pubblico_main" {
  value = module.apache.ip_pubblico
  sensitive = false
}
```