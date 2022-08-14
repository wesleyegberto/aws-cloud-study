
resource "aws_instance" "webserver" {
	# Ubuntu 22
	ami = "ami-052efd3df9dad4825"
	instance_type = "t2.micro"
	key_name = "aws-study"

	vpc_security_group_ids = [ aws_security_group.sg-public-web.id ]
	associate_public_ip_address = true

	root_block_device {
		volume_type = "gp2"
		volume_size = "30"
		delete_on_termination = true
	}

	tags = {
		Name = "ec2-ubuntu-webserver"
	}

	# script para executar no bootstrap
	user_data = "${file("webserver-setup.sh")}"
}

# Print o IP vinculado no EC2
output "IPAddress" {
  value = "${aws_instance.webserver.public_ip}"
}

