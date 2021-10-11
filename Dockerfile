
FROM openjdk:16-alpine3.13

EXPOSE 8080

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
RUN ./mvnw package
RUN cp /app/target/spring-petclinic-*.jar /app/spring-petclinic.jar

CMD ["java", "-jar", "/app/spring-petclinic.jar"]