FROM ubuntu 

#INSTALL NECESSARY PACKAGES
#==============================
RUN apt install && sudo apt upgrade -y
RUN apt install openjdk-17-jre-headless -y
RUN apt install maven -y

#SET THE WORKING DIRECTORY
#================================
WORKDIR /app

#COPY SOURCE FILES AND POM.XML
COPY ./src /app/src
COPY ./pom.xml /app

#BUILD THE APPLICATION
RUN mvn -f /app/pom.xml clean package -DskipTests

#COPY THE BUILT JAR FILE TO THE CONTAINER
COPY ./target/*.jar /app/app.jar


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
