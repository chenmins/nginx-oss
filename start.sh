#!/bin/bash

# 使用 Rclone 挂载 MinIO 至 /usr/share/nginx/html
mkdir -p /usr/share/nginx/html/abc
chown -R nginx:nginx /usr/share/nginx/html/abc
chmod -R 755 /usr/share/nginx/html/abc
rclone mount minio:/abc /usr/share/nginx/html/abc --vfs-cache-mode full --rc --daemon

# 启动 Nginx
nginx -g 'daemon off;'
