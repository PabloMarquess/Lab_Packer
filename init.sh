#!/bin/bash
sudo packer init .
sudo packer build ubuntu_cfg.pkr.hcl
