provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "ui-bucket" {
    bucket = "tmp-${var.env}-ui-bucket"
}
