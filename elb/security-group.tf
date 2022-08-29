resource "aws_security_group" "sg-loadbalancer" {
	name = "loadbalancer"
	vpc_id = aws_vpc.vpc-elb-study.id

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "sg-webserver" {
	name = "webserver"
	vpc_id = aws_vpc.vpc-elb-study.id

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		security_groups = [ aws_security_group.sg-loadbalancer.id ]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
