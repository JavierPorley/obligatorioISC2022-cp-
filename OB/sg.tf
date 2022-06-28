#Creamos los Security Groups

resource "aws_security_group" "sg_bastion" {
  name   = "allow_bastion"
  vpc_id = aws_vpc.vpc1.id
  ingress {
    description = "permite ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "permite ssh bastion"
  }
}
