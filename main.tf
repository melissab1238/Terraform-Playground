provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-00beae93a2d981137"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  # shell script or cloud-init directive. EC2 executes it on boot
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  # <<-EOF and EOF are Terraform's heredoc syntax (multi-line strings)

  # title your instance (not example). example is the terraform name
  tags = {
    Name = "terraform example"
  }
}

# you need a security group for AWS EC2 instance to recieve traffic.
#   Even though we are listing the security group after the instance,
#   terraform will know to create the security group first and use the
#   dependence in the instance vpc security group reference
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # CIDR blocks are a concise way to specify IP address ranges (from my CPSC 317 Networking class in UNI)
  }
}

