FROM nacos/nacos-server:latest
EXPOSE 8848
CMD ["sh", "/opt/nacos/bin/startup.sh"]
