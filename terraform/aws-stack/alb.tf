resource "aws_alb" "quest_alb" {
  name            = "quest-alb"
  security_groups = ["sg-0fb16ed2fbdb0b9fb"]
  subnets         = ["${var.aws_subnet_a_id}", "${var.aws_subnet_b_id}"]
  # tags            = "quest-alb"
}

# For security I forward all http traffic to https
resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = "${aws_alb.quest_alb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "redirect"

    redirect {
      port  = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "listener_https" {
  load_balancer_arn = "${aws_alb.quest_alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_id
  default_action {
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"
  }
}
