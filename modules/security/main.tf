
############################################
# SECURITY GROUP FOR ALB
############################################

resource "aws_security_group" "alb_sg" {
  name   = "alb-security-group"
  vpc_id = var.vpc_id

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
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
    Name = "alb-sg"
  }
}

############################################
# BASTION SECURITY GROUP
############################################

resource "aws_security_group" "bastion_sg" {
  name   = "bastion-security-group"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # Replace with your public IP
    cidr_blocks = ["27.7.124.32/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

############################################
# PRIVATE SERVER SECURITY GROUP
############################################

resource "aws_security_group" "private_servers_sg" {
  name   = "private-server-security-group"
  vpc_id = var.vpc_id

  ####################################
  # ALLOW HTTP FROM ALB
  ####################################

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ####################################
  # ALLOW SSH FROM BASTION
  ####################################

  ingress {
    description     = "SSH from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-server-sg"
  }
}
