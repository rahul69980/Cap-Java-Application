FROM maven:latest AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
FROM tomcat:latest


COPY --from=builder /app/target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8010
CMD ["catalina.sh", "run"]
