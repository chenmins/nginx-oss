#!/bin/bash
docker stop my-nginx-minio
docker rm my-nginx-minio
docker rmi my-nginx-minio
docker build -t my-nginx-minio .
docker run --privileged -p 9980:80 --name my-nginx-minio my-nginx-minio
