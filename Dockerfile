# 1. Dùng Tomcat 10 và Java 17
FROM tomcat:10.1-jdk21

# 2. Xóa các app mặc định của Tomcat cho nhẹ
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Tắt cổng Shutdown 8005 để tránh báo lỗi Warning
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# 4. Copy file WAR của bạn vào và đổi tên thành ROOT.war (để chạy ngay trang chủ)
COPY jobweb.war /usr/local/tomcat/webapps/ROOT.war

# 5. Mở cổng 8080
EXPOSE 8080

# 6. Chạy Tomcat
CMD ["catalina.sh", "run"]