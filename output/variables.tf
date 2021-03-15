variable "AWS_REGION" {
  type    = string
  default = "ap-northeast-1"
}

variable "AMI_NAME" {
  type = map(any)
  default = {
    ap-northeast-1 = "ami-0e039c7d64008bd84"
    ap-northeast-2 = "ami-067abcae434ee508b"
  }
}
