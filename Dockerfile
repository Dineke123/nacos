FROM openjdk:8-jre-alpine

# 安装必要的工具
RUN apk add --no-cache curl net-tools bash

# 设置时区
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 下载并解压 Nacos
RUN curl -fsSL https://github.com/alibaba/nacos/releases/download/2.0.3/nacos-server-2.0.3.tar.gz -o nacos-server.tar.gz && \
    tar -xzf nacos-server.tar.gz && \
    rm -rf nacos-server.tar.gz && \
    mv nacos-server-* nacos

# 设置启动命令
WORKDIR /nacos/bin
CMD ["sh", "startup.sh"]
