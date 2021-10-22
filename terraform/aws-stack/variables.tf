# Variables referenced inside this module, that need to be passed
# in as parameters to the module

## dont need variables if already defined in ~/.asw/credentials
# variable "aws_access_key" {}
# variable "aws_secret_key" {}

variable "aws_vpc_id" {
  description = "Value of default VPC"
  type        = string
  default     = "vpc-297a5c40"
}

variable "aws_subnet_a_id" {
  description = "Subnet A"
  type        = string
  default     = "subnet-bc2513d5"
}

variable "aws_subnet_b_id" {
  description = "Subnet B"
  type        = string
  default     = "subnet-3195e44a"
}

# variable "aws_security_group" {
#   description = "SG"
#   type        = string
#   default     = "sg-0fb16ed2fbdb0b9fb"
# }


## ec2.tf vars ##
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "QuestAppServerInstance"
}

variable "acm_id" {
  description = "Value of default ACM"
  type        = string
  default     = "arn:aws:acm:us-east-2:080303140523:certificate/c7bf9c0d-a376-46fa-b9cd-d7f3208e8652"
}
