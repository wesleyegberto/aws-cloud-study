
terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.27"
		}
	}
}

provider "aws" {
	region = "us-east-1"
	shared_credentials_file = "~/.aws/credentials"
	profile = "study"

	default_tags {
		tags = {
			Environment = "study"
			Feature = "ec2-study"
		}
	}
}

