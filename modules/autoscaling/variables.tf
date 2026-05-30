variable "private_subnets" {
  type = list(string)
}

variable "private_sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "ltemp_ami" {
  type = string
}

variable "ltemp_itype" {
  type = string
}

variable "key_name" {
  type = string
}