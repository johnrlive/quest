resource "aws_security_group" "alb_sg" {
  name        = "terraform_alb_security_group"
  description = "Terraform load balancer security group"
  vpc_id      = "${var.aws_vpc_id}"

  # ingress {
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # Allow all outbound traffic.
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # tags = "quest-alb-security-group"
}

resource "aws_security_group_rule" "egress-all" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.alb_sg.id}"
}

resource "aws_security_group_rule" "ingress-ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"          # -1 is All
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.alb_sg.id}"
}

resource "aws_security_group_rule" "ingress-http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"          # -1 is All
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.alb_sg.id}"
}

resource "aws_security_group_rule" "ingress-https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"          # -1 is All
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.alb_sg.id}"
}
