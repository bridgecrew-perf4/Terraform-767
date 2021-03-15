resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "amazonlinux2-with-nginx" {
  ami           = lookup(var.AMI_NAME, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.levelup_key.key_name

  tags = {
    "Name" = "nginx"
  }
}

resource "aws_ebs_volume" "ebs_volume_1" {
  availability_zone = "ap-northeast-1a"
  size              = 40
  type              = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

resource "aws_volume_attachment" "ebs_volume-1_attach" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs_volume_1.id
  instance_id = aws_instance.amazonlinux2-with-nginx.id
}
