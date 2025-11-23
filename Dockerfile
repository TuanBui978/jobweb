# Dùng Tomcat 10 và JDK 17 (Vì code bạn dùng jakarta.* nên cần Tomcat 10+)
FROM tomcat:10.1.13-jdk17

# Xóa các app mặc định của Tomcat cho nhẹ
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file war của bạn vào thư mục webapps và đổi tên thành ROOT.war
# (Để khi truy cập không cần gõ tên project, chỉ cần vào thẳng link là ra web)
COPY app.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]