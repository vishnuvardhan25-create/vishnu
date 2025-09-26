provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI ID (example for us-east-1)
  instance_type = "t2.micro"
  count         = 5   # <--- Creates 5 instances

  tags = {
    Name = "Terraform-Instance-${count.index + 1}"
  }
}
