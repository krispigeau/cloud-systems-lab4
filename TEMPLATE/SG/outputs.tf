output "output_sg_id" {
  description = "outputs the ID of the created Security Group"
  value       = aws_security_group.webservers.id
}
