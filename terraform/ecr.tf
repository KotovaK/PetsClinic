provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "ecr-pets-clinic" {
  provider = aws.us_east_1

  repository_name = "pets-clinic"

  catalog_data {
    about_text        = "About Text"
    architectures     = ["x86-64"]
    description       = "Description"
    operating_systems = ["Linux"]
    usage_text        = "pets-clinic"
  }
}