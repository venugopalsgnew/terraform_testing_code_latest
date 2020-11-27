provider "aws" {
    access_key = var.accesskey
    secret_key = var.secretkey
    region     = "ap-south-1"
}

module "webserver" {
    source          = "../modules/webserver"
    ami             = "ami-08f63db601b82ff5f"
    instance_type   = "t2.medium"
    env_name        = "dev"
    }

module "s3bucket" {
   source       = "../modules/s3"
   bucket_name  = "s3-erraform-up-tf-2720nov"
}

module "dynamodb" {
   source       = "../modules/dynamodb"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "s3-erraform-up-tf-2720nov"
    key            = "global/s3-dev/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "erraform-up-tf-2720nov"
    encrypt        = true
  }
}

