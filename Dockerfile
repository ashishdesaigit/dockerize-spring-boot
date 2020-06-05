# stage 1 - extract layers of application
FROM openjdk:8-jdk-alpine AS build
ARG JAR_FILE=target/*.jar
ADD ${JAR_FILE} app.jar
RUN mkdir /app \
  && cd /app \
  && jar -xf /app.jar

#Stage 2 - build layered container image
FROM openjdk:8-jre-alpine
COPY --from=build /app/BOOT-INF/lib /app/lib
COPY --from=build /app/META-INF /app/META-INF
COPY --from=build /app/BOOT-INF/classes /app
VOLUME /tmp
WORKDIR /app
EXPOSE 8080
ENTRYPOINT [ "java", "-cp", "/app:/app/lib/*" , "com.ashishd.DockerizeSpringBootApplication"]