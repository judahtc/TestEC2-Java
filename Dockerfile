# multi-stage Dockerfile for a Spring Boot application

# Build stage: build the executable JAR using Maven
FROM maven:3.9.4-eclipse-temurin-21 AS build
WORKDIR /workspace

# Copy source and build
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

# Runtime stage: run the built jar with a lightweight JRE
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the jar produced in the build stage
COPY --from=build /workspace/target/*.jar app.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]