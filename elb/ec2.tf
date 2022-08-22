resource "aws_instance" "webserver-a" {
	# Ubuntu 22
	ami = "ami-052efd3df9dad4825"
	instance_type = "t2.micro"
	# nome da Key-Pair na AWS
	key_name = "aws-study"

	availability_zone = var.aws_zone_a
	subnet_id = aws_subnet.sn-webserver-a.id

	vpc_security_group_ids = [ aws_security_group.sg-webserver.id ]
	associate_public_ip_address = false

	root_block_device {
		volume_type = "gp2"
		volume_size = "30"
		delete_on_termination = true
	}

	tags = {
		Name = "ec2-webserver-a"
	}

	user_data = "${file("webserver-setup.sh")}"
}

resource "aws_instance" "webserver-b" {
	# Ubuntu 22
	ami = "ami-052efd3df9dad4825"
	instance_type = "t2.micro"
	# nome da Key-Pair na AWS
	key_name = "aws-study"

	availability_zone = var.aws_zone_b
	subnet_id = aws_subnet.sn-webserver-b.id

	vpc_security_group_ids = [ aws_security_group.sg-webserver.id ]
	associate_public_ip_address = false

	root_block_device {
		volume_type = "gp2"
		volume_size = "30"
		delete_on_termination = true
	}

	tags = {
		Name = "ec2-webserver-b"
	}

	user_data = "${file("webserver-setup.sh")}"
}

