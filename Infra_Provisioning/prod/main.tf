provider "aws" {
    access_key = "AKIAPCNWWA"
    secret_key = "1g019lo1J2a5z4/"
    region     = "ap-south-1"
}

module "webserver" {
    source          = "../modules/webserver"
    ami             = "ami-08f63db601b82ff5f"
    instance_type   = "t2.micro"
    env_name        = "prod"
    }

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "testing-hassi-module-272020"
    key            = "global/s3-prod/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-terraform-2720nov"
    encrypt        = true
  }
}
