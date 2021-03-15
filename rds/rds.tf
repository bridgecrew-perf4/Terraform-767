resource "aws_db_subnet_group" "mariadb_subnets" {
  name        = "mariadb_subnets"
  description = "Amazon RDS Subnet Group"
  subnet_ids  = [aws_subnet.ozw-vpc2-private-subnet-1a.id, aws_subnet.ozw-vpc2-private-subnet-1c.id]

  tags = {
    Name = "mariadb_subnets"
  }
}

resource "aws_db_parameter_group" "mariadb_subnets_parameter_group" {
  name        = "mariadb-subnets-parameter-group"
  family      = "mariadb10.4"
  description = "MariaDB Parameter Group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_instance" "mariadb_instance" {
  allocated_storage       = 20
  engine                  = "mariadb"
  engine_version          = "10.4.13"
  instance_class          = "db.t3.micro"
  identifier              = "mariadb"
  name                    = "mariadb"
  username                = "root"
  password                = "mariadb141"
  db_subnet_group_name    = aws_db_subnet_group.mariadb_subnets.name
  parameter_group_name    = aws_db_parameter_group.mariadb_subnets_parameter_group.name
  multi_az                = false
  vpc_security_group_ids  = [aws_security_group.allow-mariadb.id]
  storage_type            = "gp2"
  backup_retention_period = 30
  availability_zone       = aws_subnet.ozw-vpc2-private-subnet-1a.availability_zone
  skip_final_snapshot     = true
  tags = {
    "Name" = "mariadb_instance"
  }
}

output "rds" {
  value = aws_db_instance.mariadb_instance.endpoint
}
