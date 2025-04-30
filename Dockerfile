FROM eclipse-temurin:17
LABEL mentainer="example.email@gail.com"

WORKDIR /app

COPY target/docker-demo-0.0.1-SNAPSHOT.jar  /app/docker-demo.jar

ENTRYPOINT ["java","-jar","docker-demo.jar"]