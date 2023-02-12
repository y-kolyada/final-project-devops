output "instance_id" {
  description = "ID of the EC2 web-04 instance"
  value       = aws_instance.web-04.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 web-04 instance"
  value       = aws_instance.web-04.public_ip
}
