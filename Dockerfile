FROM nacos/nacos-server:v2.1.1
EXPOSE 8848
CMD ["sh", "/opt/nacos/bin/startup.sh"]
