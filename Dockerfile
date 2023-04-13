# 基础镜像
FROM openjdk:8-jre-alpine

# 作者信息
LABEL maintainer="Your Name <your-email@example.com>"

# 安装 Bash 和 Curl 工具
RUN apk add --no-cache bash curl

# 下载并解压 Nacos
RUN curl -o nacos-server.tar.gz https://github.com/alibaba/nacos/releases/download/2.0.3/nacos-server-2.0.3.tar.gz && \
    tar -xzf nacos-server.tar.gz && \
    rm nacos-server.tar.gz

# 设置环境变量
ENV NACOS_HOME=/nacos-server
ENV PATH=$NACOS_HOME/bin:$PATH

# 暴露端口
EXPOSE 8848 9555 9600

# 启动 Nacos
CMD ["sh", "/nacos-server/bin/startup.sh"]
