data "aws_ip_ranges" "tokyo_region_ip_range" {
  regions  = ["ap-northeast-1"]
  services = ["ec2"]
}

resource "aws_security_group" "tokyo_region_sg" {
  name = "tokyo_region_sg"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = data.aws_ip_ranges.tokyo_region_ip_range.cidr_blocks
  }

  tags = {
    CreateDate = data.aws_ip_ranges.tokyo_region_ip_range.create_date
    SyncToken  = data.aws_ip_ranges.tokyo_region_ip_range.sync_token
    Name = "nginxtest-sg"
  }
}
