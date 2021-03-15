data "aws_availability_zones" "available" {}

data "aws_ami" "ubuntu-latest" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "amazonlinux2-with-nginx" {
  ami               = data.aws_ami.ubuntu-latest.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]

  provisioner "local-exec" {
    command = "echo ${aws_instance.amazonlinux2-with-nginx.private_ip} >> private_ip.txt"
  }

  tags = {
    "Name" = "nginx"
  }
}

output "public_ip" {
  value = aws_instance.amazonlinux2-with-nginx.public_ip
}
