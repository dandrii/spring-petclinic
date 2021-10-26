FROM openjdk:11
WORKDIR /var/lib/jars/target
COPY . /app
WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java","-jar","spring-petclinic-2.5.0-SNAPSHOT.jar"] CMD ["-start"]