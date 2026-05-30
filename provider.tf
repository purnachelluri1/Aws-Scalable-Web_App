provider "aws" {
  access_key = var.acc_key
  secret_key = var.sec_key
  region     = "us-east-1"
}
# data "aws_caller_identity" "name" {

# }