# Hello World Spring Boot Application

This is a simple Spring Boot application that demonstrates how to create a RESTful web service. The application responds with a greeting message when accessed at the `/hello` endpoint.

## Prerequisites

- Java 21.0.7
- Maven

## Project Structure

```
hello-world-spring-boot
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── helloworld
│   │   │               ├── HelloWorldApplication.java
│   │   │               └── controller
│   │   │                   └── HelloController.java
│   │   └── resources
│   │       ├── application.properties
│   │       └── static
│   └── test
│       └── java
│           └── com
│               └── example
│                   └── helloworld
│                       └── HelloWorldApplicationTests.java
├── pom.xml
└── README.md
```

## Building the Application

To build the application, navigate to the project directory and run the following command:

```
mvn clean install
```

## Running the Application

To run the application, use the following command:

```
mvn spring-boot:run
```

Once the application is running, you can access the greeting message by navigating to:

```
http://localhost:8080/hello
```

## Testing the Application

The application includes test cases to verify its functionality. You can run the tests using the following command:

```
mvn test
```

## License

This project is licensed under the MIT License.