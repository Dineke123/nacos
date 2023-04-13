# 基于官方 Nacos 镜像构建自定义镜像
FROM nacos/nacos-server:2.0.1

# 安装 curl 和 net-tools
RUN apt-get update && apt-get install -y curl net-tools

# 设置环境变量
ENV MODE=standalone \
    PREFER_HOST_MODE=hostname \
    NACOS_SERVERS=localhost:8848 \
    NACOS_SERVER_PORT=8848 \
    NACOS_APPLICATION_PORT=8848 \
    NACOS_APPLICATION_GROUP=default \
    NACOS_APPLICATION_NAME=nacos-docker

# 暴露端口
EXPOSE 8848 9848

# 运行容器时执行的命令
CMD ["sh", "-c", "cd /home/nacos/bin && sh startup.sh -m $MODE"]
