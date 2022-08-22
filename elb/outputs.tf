output "elb-study-dns" {
	value = "DNS: ${aws_lb.elb-webserver.dns_name}"
}
