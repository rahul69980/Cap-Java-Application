FROM openjdk:latest
RUN npm install pom.xml
WORKDIR /app
COPY . .
EXPOSE 8010
CMD ["java","mavenwebappdeployement.yaml"]