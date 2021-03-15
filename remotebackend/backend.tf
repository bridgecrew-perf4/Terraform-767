terraform {
  backend "s3" {
    bucket = "ozwterraform-bucket"
    key    = "development/terraform_state"
    region = "ap-northeast-1"
  }
}
