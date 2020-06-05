# dockerize-spring-boot

Dockerize spring boot app using multi stage build.
Refer to `Dockerfile` for details.
Multi stage build helps reduce size of final docker image.

### Build spring boot application
```bash
./mvnw clean install
```

### Build docker image
```bash
docker build -t <your docker registry>/dockerize-spring-boot .
```

### Run docker image
```bash
 docker run -p 8080:8080 <your docker registry>/dockerize-spring-boot
```

### Test
```bash
curl http://localhost:8080/greeting
=> Hello from container
```

## What else can be done

As per your preference you can containerize your spring boot application in multiple ways
  1.  Using Jib plugin
  2.  If you are using spring 2.3 then it is even simpler
      ``` bash
      ./mvnw spring-boot:build-image
      ```
      
      
