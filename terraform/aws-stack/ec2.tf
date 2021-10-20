# EC2 instances.
# Docs: https://www.terraform.io/docs/providers/aws/r/instance.html

resource "aws_instance" "app_server" {
  ami             = "ami-074cce78125f09d61"
  instance_type   = "t2.micro"
  key_name        = "devops-east2"
  subnet_id       = "${var.aws_subnet_a_id}"
  #user_data       = "${file("./userdata.txt")}"
  security_groups = ["${aws_security_group.alb_sg.id}"]


  tags = {
    Name = var.instance_name
  }
}
