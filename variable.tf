variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "ami_id_us_east_1" {
  description = "AMI ID for us-east-1"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "ami_id_us_west_1" {
  description = "AMI ID for us-west-1"
  type        = string
  default     = "ami-08012c0a9ee8e21c4"
}
