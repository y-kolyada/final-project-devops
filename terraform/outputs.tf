output "instance_name" {
  description = "Name of the EC2 instance"
  value       = aws_instance.prod-devopskb.tags["Name"]
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.prod-devopskb.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 web-04 instance"
  value       = aws_instance.prod-devopskb.public_ip
}
