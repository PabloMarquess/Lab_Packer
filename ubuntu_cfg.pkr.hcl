packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu-nginx" {
  ami_name = "nginx-server-${local.timestamp}"
  source_ami_filter {
    filters = {
      name                = "ubuntu-*-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  instance_type = "t2.micro"
  region        = "us-east-2"
  ssh_username  = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.ubuntu-nginx"
  ]

  provisioner "shell" {
    script = "scripts/conf_nginx.sh"
  }
}