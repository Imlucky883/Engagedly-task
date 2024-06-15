resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.private.id
  key_name      = "bastion"  # Replace with your key pair name

  tags = {
    Name = var.bastion_instance_name
  }

  # No user data for bastion host

  security_groups = [
    aws_security_group.bastion_sg.id
  ]
}

