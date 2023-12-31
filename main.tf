
data "template_file" "user_data" {
  template = file("${abspath(path.module)}/userdata.yaml")
}

data "aws_ami" "eu-amazon-linux2" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_vpc" "cloud_privato" {
  id = var.vpc_id
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cloud_privato.id]
  }
  depends_on = [data.aws_vpc.cloud_privato]
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}



resource "aws_instance" "app_server" {
  ami                    = "${data.aws_ami.eu-amazon-linux2.id}"
  subnet_id              = element(data.aws_subnets.subnets.ids,1)
  associate_public_ip_address = true
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg_app_server.id]
  user_data              = data.template_file.user_data.rendered
  

  tags = {
    Name = var.server_name
  }
}



resource "aws_security_group" "sg_app_server" {
  name        = "sg_app_server"
  description = "Allow HTTP and SSH"
  vpc_id      = data.aws_vpc.cloud_privato.id

  ingress = [{
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.my_ip]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    },
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.my_ip]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    description      = "output traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http_ssh"
  }
}