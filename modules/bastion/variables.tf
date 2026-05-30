variable "key_name" {
  description = "key value"
}
variable "ami" {
  description = "ami value for servers"
}
variable "instance_type" {
  description = "instance type value"
}
variable "subnet_id" {
  type = string
}

variable "bastion_sg_id" {
  type = string
}