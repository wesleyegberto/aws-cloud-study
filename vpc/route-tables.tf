
resource "aws_route_table" "rt-public-web" {
	vpc_id = aws_vpc.vpc-study.id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.igw-study.id
	}

	tags = {
		Name = "rt-public-web"
	}
}

resource "aws_route_table" "rt-database" {
	vpc_id = aws_vpc.vpc-study.id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.nat-database.id
	}

	tags = {
		Name = "rt-database"
	}
}

resource "aws_route_table" "rt-management" {
	vpc_id = aws_vpc.vpc-study.id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.nat-management.id
	}

	tags = {
		Name = "rt-management"
	}
}

resource "aws_route_table_association" "ass-rt-subnet-public-web" {
	subnet_id = aws_subnet.public-web.id
	route_table_id = aws_route_table.rt-public-web.id
}

resource "aws_route_table_association" "ass-rt-subnet-database" {
	subnet_id = aws_subnet.database.id
	route_table_id = aws_route_table.rt-database.id
}

resource "aws_route_table_association" "ass-rt-subnet-management" {
	subnet_id = aws_subnet.management.id
	route_table_id = aws_route_table.rt-management.id
}

