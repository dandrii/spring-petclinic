variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "region-master" {
  type    = string
  default = "eu-central-1"
}
variable "profile" {
  type    = string
  default = "default"
}

variable "dockerimage" {
  type    = string
  default = "latest"
}