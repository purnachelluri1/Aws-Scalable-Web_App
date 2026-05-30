# variable "key_name" {
#   description = "key value"
# }
# variable "acc_key" {
#   description = "value od acc key"
# }
# variable "sec_key" {
#   description = "value of sec key"
# }
variable "vpc_cidr" {
  description = "value of vpc cidr block"
}

variable "pub_availability_zone1" {
  description = "Zone for public subnet"
}
variable "pub_availability_zone2" {
  description = "Zone for public subnet"
}
variable "priv_availability_zone1" {
  description = "Zone for public subnet"
}
variable "priv_availability_zone2" {
  description = "Zone for public subnet"
}


variable "pub_sub1" {
  description = "value"
}

variable "pub_sub2" {
  description = "value"
}

variable "priv_sub1" {
  description = "value"
}

variable "priv_sub2" {
  description = "value"
}
