# Use official Tomcat base image
FROM tomcat:9.0

# Remove default web apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your built WAR file to webapps directory
COPY build/CafeMgt.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 9090 instead of 8080
EXPOSE 9090

# Run Tomcat
CMD ["catalina.sh", "run"]
