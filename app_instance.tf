resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.private.id
  key_name      = "bastion"  # Replace with your key pair name
  tags = {
    Name = var.app_instance_name
  }

  user_data = file(var.user_data_path_app)

  security_groups = [
    aws_security_group.app_sg.id,
    aws_security_group.bastion_sg.id
  ]
}

