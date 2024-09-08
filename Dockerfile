FROM nginx:latest

# 安装 Rclone
ADD rclone-v1.67.0-linux-amd64.zip /tmp/

RUN apt-get update && \
    apt-get install -y  unzip fuse3 && \
    unzip /tmp/rclone-v1.67.0-linux-amd64.zip -d /tmp && \
    cp /tmp/rclone-v1.67.0-linux-amd64/rclone /usr/bin/ && \
    chmod +x /usr/bin/rclone && \
    rm -rf rclone-*

# 清理
RUN apt-get remove --purge -y   unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 复制 Rclone 配置文件
COPY rclone.conf /root/.config/rclone/rclone.conf

# 设置启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
