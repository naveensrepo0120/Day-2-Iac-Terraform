provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"
  alias      = "us_east_1"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-west-1"
  alias      = "us_west_1"
}

resource "aws_security_group" "east_sg" {
  provider    = aws.us_east_1
  name        = "east_security_group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
    Name = "east_security_group"
  }
}

resource "aws_security_group" "west_sg" {
  provider    = aws.us_west_1
  name        = "west_security_group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
    Name = "west_security_group"
  }
}

resource "aws_instance" "east" {
  provider = aws.us_east_1
  ami           = var.ami_id_us_east_1
  instance_type = var.instance_type
  user_data     = file("user_data.sh")
  security_groups = [aws_security_group.east_sg.name]

  tags = {
    Name = "nginx-server-east"
  }
}

resource "aws_instance" "west" {
  provider = aws.us_west_1
  ami           = var.ami_id_us_west_1
  instance_type = var.instance_type
  user_data     = file("user_data.sh")
  security_groups = [aws_security_group.west_sg.name]

  tags = {
    Name = "nginx-server-west"
  }
}
