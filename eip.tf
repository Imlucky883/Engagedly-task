resource "aws_eip" "lb" {
  instance = aws_instance.bastion.id
}
