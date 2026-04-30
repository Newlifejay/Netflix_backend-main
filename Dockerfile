# Use a lightweight Java runtime
FROM eclipse-temurin:25-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Source files and pom.xml
COPY ./src /app/src
COPY ./pom.xml /app/

#Buid the application
RUN mvn -f /app/pom.xml clean package -DskipTests

# Expose application port (adjust if needed)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]