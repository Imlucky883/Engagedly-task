resource "aws_instance" "db" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.private.id
  key_name      = "bastion"  # Replace with your key pair name

  tags = {
    Name = var.db_instance_name
  }

  user_data = file(var.user_data_path_db)

  security_groups = [
    aws_security_group.db_sg.id
  ]
}

