# Build and generate Jar file
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY ./pom.xml .
COPY ./src ./src
RUN mvn clean package

# Run the app
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/app.jar ./app.jar

CMD ["java", "-jar", "app.jar"]
