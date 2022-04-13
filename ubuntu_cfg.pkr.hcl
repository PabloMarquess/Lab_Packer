packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu-nginx"{
  ami_name = "nginx-server"
  source_ami = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro" 
  region = "us-east-2"
  ssh_username = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.ubuntu-nginx"
  ]
}