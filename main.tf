provider "aws" {
	region = "us-east-2"
	access_key = "AKIAZQ3DPNXT46LMQFP6"
	secret_key = "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"
}

resource "aws_vpc" "development-vpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		Name: "development"
	}
}

resource "aws_subnet" "development-subnet" {
	vpc_id = aws_vpc.development-vpc.id
	cidr_block = "10.0.10.0/24"
	availability_zone = "us-east-2a"
	tags = {
		Name: "subnet-1-dev"
	}
}

data "aws_vpc" "existing_vpc" {
	default = true
}

output "dev-vpc-id" {
	value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
	value = aws_subnet.development-subnet.id 
}
