
resource "aws_vpc" "vpc-study" {
	cidr_block = var.vpc-cidr
	tags = {
		Name = "vpc-study"
	}
}

