# multi-stage Dockerfile for a Spring Boot application

# Build stage: build the executable JAR using Maven
FROM public.ecr.aws/amazoncorretto/amazoncorretto:21 AS build

# Install Maven 3.9.4
RUN yum update -y && yum install -y wget tar gzip && \
    wget https://archive.apache.org/dist/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz && \
    tar -xzf apache-maven-3.9.4-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.9.4/bin/mvn /usr/local/bin/mvn

WORKDIR /workspace

# Copy source and build
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

# Runtime stage: run the built jar with a lightweight JRE
FROM public.ecr.aws/amazoncorretto/amazoncorretto:21
WORKDIR /app

# Copy the jar produced in the build stage
COPY --from=build /workspace/target/*.jar app.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]