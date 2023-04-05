variable "aws_region" {
  type    = string
  default = "us-west-2"
}
variable "vpc_name" {
  type    = string
  default = "terraform-webserver-vpc"
}
variable "lt_name" {
  type    = string
  default = "terraform-webserver-lt"
}
variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "azs" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
variable "ami_id" {
  type    = string
  default = "ami-0223246728818f162"
}