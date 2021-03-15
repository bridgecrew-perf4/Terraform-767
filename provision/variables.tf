variable "AWS_REGION" {
  type    = string
  default = "ap-northeast-1"
}

variable "SECURITY_GROUP" {
  type    = list(any)
  default = ["sg-0123", "sg-4567", "sg-8910"]
}

variable "AMI_NAME" {
  type = map(any)
  default = {
    ap-northeast-1 = "ami-0e039c7d64008bd84"
    ap-northeast-2 = "ami-067abcae434ee508b"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  type    = string
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  type    = string
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
  type    = string
  default = "ubuntu"
}
