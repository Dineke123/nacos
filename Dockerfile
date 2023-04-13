FROM openjdk:8-jdk-alpine
MAINTAINER nacos
ADD . /home/nacos
WORKDIR /home/nacos
RUN chmod +x /home/nacos/bin/*.sh
RUN apk add --no-cache bash
EXPOSE 8848
CMD ["bin/startup.sh"]
