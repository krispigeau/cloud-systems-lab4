
resource "aws_launch_template" "ha" {
  name                   = "${var.prefix}-template"
  image_id               = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.prefix}-lt"
    }
  }
}

resource "aws_lb_target_group" "asg-tg" {
  name     = "${var.prefix}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

/*
resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.subnet_ids
  target_group_arns    = [aws_lb_target_group.asg-tg.arn]
  health_check_type = "ELB"
  min_size          = 2
  max_size          = 4
  launch_template {
    id      = aws_launch_template.ha.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}


resource "aws_lb" "loadbalancer" {
  name               = "loadbalancer"
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [var.sg_id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}



resource "aws_lb_listener_rule" "asg-listen" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
  condition {
    path_pattern {
      values = ["*"]
    }

  }
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg-tg.arn
  }
}
*/