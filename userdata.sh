#!/bin/bash

apt update -y

apt install -y docker.io

systemctl start docker
systemctl enable docker

docker pull vasuch2626/scalable-webapp:v5

docker run -d -p 80:80 --restart always --name webapp vasuch2626/scalable-webapp:v5