## These variables end up being declared twice, once in the module and
## once in this script so they can be refereced from the .tfvars file.

## not a good idea to save aws credentials to git
## or use [default] profile in ~/.asw/credentials
# variable "aws_access_key" {}
# variable "aws_secret_key" {}
#variable "aws_vpc_id" {}
#variable "aws_subnet_a_id" {}
#variable "aws_subnet_b_id" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
  ## WARNING: Do not commit keys to git (local testing)
  # access_key = "${var.aws_access_key}"
  # secret_key = "${var.aws_secret_key}"
}

module "aws-stack" {
  source = "./aws-stack/"

  # These values come from the variables.tf file
  # aws_vpc_id      = "${var.aws_vpc_id}"
  # aws_subnet_a_id = "${var.aws_subnet_a_id}"
  # aws_subnet_b_id = "${var.aws_subnet_b_id}"
}
