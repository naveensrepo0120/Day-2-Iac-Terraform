output "us_east_1_instance_public_ip" {
  description = "The public IP of the EC2 instance in us-east-1"
  value       = aws_instance.east.public_ip
}

output "us_west_1_instance_public_ip" {
  description = "The public IP of the EC2 instance in us-west-1"
  value       = aws_instance.west.public_ip
}
