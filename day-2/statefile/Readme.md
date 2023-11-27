######## Multiple Region Implementation in Terraform ############
You can make use of alias keyword to implement multi region infrastructure setup in terraform.

provider "aws" {
  region = "ap-south-1"
}
provider "aws" {
  region = "us-east-1"
  alias = "america"
}

resource "aws_s3_bucket" "test" {
  bucket = "del-hyd-naresh-it"

}
resource "aws_s3_bucket" "test2" {
  bucket = "del-hyd-naresh-it-test2"
  provider = aws.america
  
}
