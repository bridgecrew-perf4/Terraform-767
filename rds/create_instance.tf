resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "amazonlinux2-with-nginx" {
  ami                    = lookup(var.AMI_NAME, var.AWS_REGION)
  instance_type          = "t2.micro"
  availability_zone      = "ap-northeast-1a"
  key_name               = aws_key_pair.levelup_key.key_name
  vpc_security_group_ids = [aws_security_group.allow-ozwvpc2-ssh.id]
  subnet_id              = aws_subnet.ozw-vpc2-public-subnet-1a.id

  tags = {
    "Name" = "nginx"
  }
}

output "public_ip" {
  value = aws_instance.amazonlinux2-with-nginx.public_ip
}
