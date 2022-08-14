
resource "aws_internet_gateway" "igw-study" {
	vpc_id = aws_vpc.vpc-study.id

	tags = {
		Name = "igw-study"
	}
}

resource "aws_eip" "eip-database" {
	vpc = true

	tags = {
		Name = "eip-database"
	}
}

resource "aws_eip" "eip-management" {
	vpc = true

	tags = {
		Name = "eip-management"
	}
}

resource "aws_nat_gateway" "nat-database" {
	allocation_id = aws_eip.eip-database.id
	subnet_id = aws_subnet.database.id

	tags = {
		Name = "nat-database"
	}
}

resource "aws_nat_gateway" "nat-management" {
	allocation_id = aws_eip.eip-management.id
	subnet_id = aws_subnet.management.id

	tags = {
		Name = "nat-management"
	}
}

