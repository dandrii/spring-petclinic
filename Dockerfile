FROM openjdk:11
COPY ./target/spring-petclinic-2.5.0-SNAPSHOT.jar /app
#WORKDIR /app

EXPOSE 8080

#ENTRYPOINT ["java","-jar","spring-petclinic-2.5.0-SNAPSHOT.jar"]