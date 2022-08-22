# VPC e Subnets

resource "aws_vpc" "vpc-elb-study" {
	cidr_block = var.vpc-cidr
	tags = {
		Name = "vpc-elb-study"
	}
}

resource "aws_subnet" "sn-webserver-a" {
	vpc_id = aws_vpc.vpc-elb-study.id
	availability_zone = var.aws_zone_a
	cidr_block = var.vpc-subnet-a-cidr

	tags = {
		Name = "sn-webserver-a"
	}
}

resource "aws_subnet" "sn-webserver-b" {
	vpc_id = aws_vpc.vpc-elb-study.id
	availability_zone = var.aws_zone_b
	cidr_block = var.vpc-subnet-b-cidr

	tags = {
		Name = "sn-webserver-b"
	}
}

# Gateways

resource "aws_internet_gateway" "igw-elb-study" {
	vpc_id = aws_vpc.vpc-elb-study.id

	tags = {
		Name = "igw-elb-study"
	}
}

resource "aws_eip" "eip-webserver-a" {
	vpc = true

	tags = {
		Name = "eip-webserver-a"
	}
}

resource "aws_eip" "eip-webserver-b" {
	vpc = true

	tags = {
		Name = "eip-webserver-b"
	}
}

resource "aws_nat_gateway" "nat-webserver-a" {
	allocation_id = aws_eip.eip-webserver-a.id
	subnet_id = aws_subnet.sn-webserver-a.id

	tags = {
		Name = "nat-webserver-a"
	}
}

resource "aws_nat_gateway" "nat-webserver-b" {
	allocation_id = aws_eip.eip-webserver-b.id
	subnet_id = aws_subnet.sn-webserver-b.id

	tags = {
		Name = "nat-webserver-b"
	}
}

# Route Tables

resource "aws_route_table" "rt-webserver-a" {
	vpc_id = aws_vpc.vpc-elb-study.id

	route {
		cidr_block = "0.0.0.0/0"
		# nat_gateway_id = aws_nat_gateway.nat-webserver-a.id
		gateway_id = aws_internet_gateway.igw-elb-study.id
	}

	tags = {
		Name = "rt-webserver-a"
	}
}

resource "aws_route_table" "rt-webserver-b" {
	vpc_id = aws_vpc.vpc-elb-study.id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.nat-webserver-b.id
	}

	tags = {
		Name = "rt-webserver-b"
	}
}

resource "aws_route_table_association" "ass-rt-subnet-webserver-a" {
	subnet_id = aws_subnet.sn-webserver-a.id
	route_table_id = aws_route_table.rt-webserver-a.id
}

resource "aws_route_table_association" "ass-rt-subnet-webserver-b" {
	subnet_id = aws_subnet.sn-webserver-b.id
	route_table_id = aws_route_table.rt-webserver-b.id
}

