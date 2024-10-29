resource "aws_instance" "frontend_1" {
  ami                         = "ami-0b4c7755cdf0d9219"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  subnet_id                   = aws_subnet.public_subnet_1.id
  key_name                    = "jonag"
  associate_public_ip_address = true

  tags = {
    Name = var.frontend_1_name
  }

  user_data = file("${path.module}/install_frontend.sh")
}

resource "aws_instance" "frontend_2" {
  ami                         = "ami-0b4c7755cdf0d9219"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  subnet_id                   = aws_subnet.public_subnet_2.id
  key_name                    = "jonag"
  associate_public_ip_address = true

  tags = {
    Name = var.frontend_2_name
  }

  user_data = file("${path.module}/install_frontend.sh")
}

resource "aws_instance" "backend_1" {
  ami                         = "ami-0b4c7755cdf0d9219"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.backend_sg.id]
  subnet_id                   = aws_subnet.private_subnet_1.id
  key_name                    = "jonag"
  associate_public_ip_address = true

  tags = {
    Name = var.backend_1_name
  }

  user_data = file("${path.module}/install_backend.sh")
}

resource "aws_instance" "backend_2" {
  ami                         = "ami-0b4c7755cdf0d9219"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.backend_sg.id]
  subnet_id                   = aws_subnet.private_subnet_2.id
  key_name                    = "jonag"
  associate_public_ip_address = true

  tags = {
    Name = var.backend_2_name
  }

  user_data = file("${path.module}/install_backend.sh")
}