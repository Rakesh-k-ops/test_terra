variable "instance_type" {
  description = "Instance type for Jenkins master and slave"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "jen"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  default     = "ami-04b4f1a9cf54c11d0" # 
}
