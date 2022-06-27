#Desplegamos el bastion

resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg2.id, aws_security_group.sg3.id]
  subnet_id                   = aws_subnet.sub-1c.id
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }
}

