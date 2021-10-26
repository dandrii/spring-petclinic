FROM openjdk:11
COPY ./target/spring-petclinic-2.5.0-SNAPSHOT.jar /app/petclinic.jar
WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java","-jar","petclinic.jar"]