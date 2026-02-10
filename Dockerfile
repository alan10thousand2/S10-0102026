# 使用官方 Maven + JDK 17 映像檔來建置
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 使用官方 OpenJDK 17 slim 版本作為基底
#FROM openjdk:17-jdk-slim
FROM eclipse-temurin:17-jdk-alpine

# 設定工作目錄
WORKDIR /app

# 複製 JAR 檔到容器內
COPY --from=build /app/target/S10-0102026-0.0.1-SNAPSHOT.jar app.jar

# 啟動 Spring Boot 應用程式
ENTRYPOINT ["java","-jar","app.jar"]
