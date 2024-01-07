terraform {
  backend "s3" {
    bucket = "kopsbucketk8s"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
