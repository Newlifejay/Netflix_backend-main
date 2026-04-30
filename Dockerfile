# FROM ubuntu 

# #INSTALL NECESSARY PACKAGES
# #==============================
# RUN apt-get update && apt-get install -y
# RUN apt install openjdk-17-jre-headless -y
# RUN apt install maven -y

# #SET THE WORKING DIRECTORY
# #================================
# WORKDIR /app

# #COPY SOURCE FILES AND POM.XML
# COPY ./src /app/src
# COPY ./pom.xml /app

# #BUILD THE APPLICATION
# RUN mvn -f /app/pom.xml clean package -DskipTests
# RUN ls -la /app/target 

# EXPOSE 8080

# ENTRYPOINT ["java", "-jar", "app.jar"]

==========================================
FROM eclipse-temurin:25 
RUN mkdir /opt/app
COPY japp.jar /opt/app
COPY ["java", "-jar", "/opt/app/japp.jar"]