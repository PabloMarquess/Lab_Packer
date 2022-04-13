#!/bin/bash
sleep 30

sudo apt-get update -y
sudo apt-get install nginx -y
sudo apt-get install -f -y
sudo systemctl enable --now nginx
