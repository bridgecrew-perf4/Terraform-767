##################################################
# Resource - Keypairs -
##################################################
resource "aws_key_pair" "demo-keypair-pub" {
  key_name   = "demo-keypair.pub"
  public_key = file(local.sshkeypath)

  tags = {
    Name = "${local.environment}-keypair"
    Env  = local.environment
  }
}

##################################################
# Resource - AMI -
##################################################
data "aws_ami" "demo-ami" {
  owners = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "demo-amzn2-nginx"
    ]
  }
}

##################################################
# Resource - EC2 -
##################################################
resource "aws_instance" "demo-instance" {
  ami           = data.aws_ami.demo-ami.id
  instance_type = var.demo-instance-type
  subnet_id     = aws_subnet.demo-subnet.id
  vpc_security_group_ids = [
    aws_security_group.demo-security-group.id
  ]
  key_name = aws_key_pair.demo-keypair-pub.key_name
  tags = {
    Name = "${local.environment}-ec2"
    Env  = local.environment
  }
}
