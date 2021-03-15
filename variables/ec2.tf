resource "aws_instance" "amazonlinux2-with-nginx" {
  ami           = lookup(var.AMI_NAME, var.AWS_REGION)
  instance_type = "t2.micro"
  count         = 3

  tags = {
    "Name" = "nginx-${count.index}"
  }

  security_groups = var.SECURITY_GROUP
}
