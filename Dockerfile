FROM openjdk:8-jre-alpine

# 安装curl
RUN apk add --no-cache curl

# 下载并解压Nacos Server
RUN curl -o nacos-server-2.0.1.tar.gz https://github.com/alibaba/nacos/releases/download/2.0.1/nacos-server-2.0.1.tar.gz && \
    tar -xvf nacos-server-2.0.1.tar.gz && \
    mv nacos-server-2.0.1 /app/nacos-server && \
    rm nacos-server-2.0.1.tar.gz


# 暴露Nacos Server和Spring Boot应用的端口
EXPOSE 8848

# 运行Spring Boot应用和Nacos Server
CMD ["/app/nacos-server/bin/startup.sh","-m","standalone"]
