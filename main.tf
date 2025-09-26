provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "myec2" {
  ami           = "ami-01b6d88af12965bb6" # Amazon Linux 3 AMI ID (example for us-east-1)
  instance_type = "t3.micro"
  count         = 5   # <--- Creates 5 instances

  tags = {
    Name = "Terraform-Instance-${count.index + 1}"
  }
}
