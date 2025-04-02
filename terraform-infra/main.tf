provider "aws" {
    region = "us-east-1"
    
}

terraform {
  backend "s3" {
    bucket         = "amirmamdouhbucket"  
    key            = "terraform/state.tfstate"    
    region         = "us-east-1"                  
    encrypt        = true                         
#    dynamodb_table = "terraform-lock-table"      
  }
}


resource "aws_vpc" "grad-ivolve" {  
   cidr_block = "10.0.0.0/16"
}


resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = aws_vpc.grad-ivolve.id
}

