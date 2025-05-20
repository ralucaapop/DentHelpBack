FROM eclipse-temurin:21-jdk

# Setăm un argument pentru fișierul JAR
ARG JAR_FILE=target/*.jar

# Copiem fișierul JAR în container
COPY ${JAR_FILE} app.jar

# Comanda care pornește aplicația
ENTRYPOINT ["java", "-jar", "/app.jar"]