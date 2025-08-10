# Use a base image with OpenJDK 17
FROM openjdk:17-jdk-slim

# Install Maven
RUN apt-get update && apt-get install -y maven && apt-get clean;

# Set the working directory
WORKDIR /app

# Copy the entire project
COPY . .

# Build the project
RUN mvn clean package 

# Expose port 8080
EXPOSE 8080

# Command to run the JAR file
ENTRYPOINT ["java", "-jar", "target/sendevops-0.0.1-SNAPSHOT.jar"]





# # Stage 1 - Build
# FROM maven:3.8.8-eclipse-temurin-17 AS build
# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# # Stage 2 - Run
# FROM eclipse-temurin:17-jdk
# WORKDIR /app
# COPY --from=build /app/target/myapp.jar app.jar
# Expose port 8080
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "app.jar"]
