resource "aws_elb" "clb" {
  name            = "classic-lb"
  subnets         = [aws_subnet.public-1.id, aws_subnet.public-2.id, aws_subnet.public-3.id]
  security_groups = [aws_security_group.web.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    target              = "HTTP:80/"
    interval            = 10
  }
  instances                   = [aws_instance.web-1.id, aws_instance.web-2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "Classic-LB"
  }

}