# Dùng Tomcat 10 (để chạy Jakarta) và Java 21 (để đọc file .class của bạn)
FROM tomcat:10.1-jdk21

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Tắt cổng shutdown 8005 để server ổn định trên Cloud
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Copy file WAR xịn của bạn vào
COPY jobweb.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]