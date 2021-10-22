# ALB target group and instance to target group mapping
# Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

resource "aws_alb_target_group" "alb_target_group" {
  name     = "quest-alb-target"
  port     = 443
  protocol = "HTTP"
  vpc_id   = "${var.aws_vpc_id}"
  stickiness {
    type = "lb_cookie"
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/"
    port = 443
  }
}

resource "aws_lb_target_group_attachment" "app-server-target-group-0" {
  target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
  target_id        = "${element(aws_instance.app_server.*.id, 0)}"
  # target_id        = "${aws_instance.app_server.id}"
  port             = 443
}

resource "aws_alb_target_group_attachment" "app-server-target-group-1" {
  target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
  target_id        = "${element(aws_instance.app_server.*.id, 1)}"
  port             = 443
}
