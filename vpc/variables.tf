
variable "aws_region" {
	default = "us-east-1"
}

variable "vpc-cidr" {
	default = "10.1.0.0/16"
}

variable "vpc-public-web-subnet-cidr" {
	default = "10.1.1.0/24"
}

variable "vpc-database-subnet-cidr" {
	default = "10.1.2.0/24"
}

variable "vpc-management-subnet-cidr" {
	default = "10.1.0.0/24"
}

