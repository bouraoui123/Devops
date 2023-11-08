FROM openjdk:11
EXPOSE 8082
ADD target/devopsprojet.jar devopsprojet.jar
ENTRYPOINT ["java","-jar","/devops.jar"]
