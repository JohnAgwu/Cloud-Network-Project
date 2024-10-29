#To create a Redis server, we’ll configure a single EC2 instance in one of the private subnets. 
#We’ll also add a security group to allow communication with the backend servers.

# Redis Security Group (allows access only from backend security group)
resource "aws_security_group" "redis_sg" {
  name   = "redis-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    security_groups  = [aws_security_group.backend_sg.id]  # Allow only backend SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "redis-sg"
  }
}

# Redis Instance in Private Subnet
resource "aws_instance" "redis" {
  ami             = "ami-0b4c7755cdf0d9219"  # Replace with an appropriate Redis-compatible AMI
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet_1.id
  security_groups = [aws_security_group.redis_sg.id]
  key_name        = "jonag"

  tags = {
    Name = "redis-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y redis-server
              sudo systemctl enable redis-server
              sudo systemctl start redis-server
              EOF
}
