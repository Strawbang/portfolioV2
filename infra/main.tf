terraform {
  backend "s3" {
    bucket = "configterraform"
    key    = "portfoliov2/terraform.tfstate"
    region = "eu-west-3"
  }
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["debian-*"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

provider "aws" {
  region  = "eu-west-3"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "EC2_1"

  tags = {
    Name = "StrawCode"
  }
}