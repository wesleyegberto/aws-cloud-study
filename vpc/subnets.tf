
resource "aws_subnet" "public-web" {
	vpc_id = aws_vpc.vpc-study.id
	cidr_block = var.vpc-public-web-subnet-cidr

	tags = {
		Name = "public-web"
	}
}

resource "aws_subnet" "database" {
	vpc_id = aws_vpc.vpc-study.id
	cidr_block = var.vpc-database-subnet-cidr

	tags = {
		Name = "database"
	}
}

resource "aws_subnet" "management" {
	vpc_id = aws_vpc.vpc-study.id
	cidr_block = var.vpc-management-subnet-cidr

	tags = {
		Name = "management"
	}
}

