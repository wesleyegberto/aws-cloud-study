variable "aws_region" {
	default = "us-east-1"
}

variable "aws_zone_a" {
	default = "us-east-1a"
}

variable "aws_zone_b" {
	default = "us-east-1b"
}

variable "vpc-cidr" {
	default = "10.1.0.0/16"
}

variable "vpc-subnet-a-cidr" {
	default = "10.1.1.0/24"
}

variable "vpc-subnet-b-cidr" {
	default = "10.1.2.0/24"
}

