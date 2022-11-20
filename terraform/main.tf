resource "aws_security_group" "web_server" {
  name        = "WebServer"
  description = "Allow HTTPC inbound traffic"

  ingress {
    description      = "HTTP from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.amz2Linux.id
  instance_type          = var.web_server_instance_type
  vpc_security_group_ids = [aws_security_group.web_server.id]
  tags = {
    "Name" = "WebServer"
  }
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
echo "<html><body><h1>Hello World!</h1></body></html>" >/var/www/html/index.html
systemctl start httpd
systemctl enable httpd
EOF
}
