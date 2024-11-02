variable "environment" {
  type    = string
  default = "production"
}

variable "region_list" {
  type    = list(string)
  default = ["us-east-1", "us-west-1", "eu-central-1"]
}

variable "create_buckets" {
  type    = bool
  default = true
}

variable "allowed_regions" {
  type    = list(string)
  default = ["us-east-1", "eu-central-1"]
}
