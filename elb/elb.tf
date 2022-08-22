# LB é a nova versão (ELB é a versão classic)
resource "aws_lb" "elb-webserver" {
	name = "elb-webserver"
	# Tipo do LB: Application (HTTP e HTTPS)
	load_balancer_type = "application"
	internal = false

	security_groups = [ aws_security_group.sg-webserver.id ]
	subnets = [ aws_subnet.sn-webserver-a.id, aws_subnet.sn-webserver-b.id ]

	tags = {
		Name = "elb-webserver"
	}
}

# Declara o Target Group
resource "aws_lb_target_group" "tg-webservers" {
	name = "elb-tg-webservers"
	port = 80
	protocol = "HTTP"
	vpc_id = aws_vpc.vpc-elb-study.id
	# EC2
	target_type = "instance"

	health_check {
		enabled = true
		path = "/"
		interval = 10
		timeout = 3
		healthy_threshold = 2
		unhealthy_threshold = 2
	}
}

# Vincula o EC2 webserver-a no Target Group
resource "aws_lb_target_group_attachment" "elb-tg-att-webserver-a" {
	target_group_arn = aws_lb_target_group.tg-webservers.arn
	target_id = aws_instance.webserver-a.id
	port = 80
}

# Vincula o EC2 webserver-b no Target Group
resource "aws_lb_target_group_attachment" "elb-tg-att-webserver-b" {
	target_group_arn = aws_lb_target_group.tg-webservers.arn
	target_id = aws_instance.webserver-b.id
	port = 80
}

# Vincula o Target Group no ELB
resource "aws_lb_listener" "elb-tg-listener" {
	load_balancer_arn = aws_lb.elb-webserver.arn

	port = 80
	protocol = "HTTP"

	default_action {
		type = "forward"
		target_group_arn = aws_lb_target_group.tg-webservers.arn
	}
}

