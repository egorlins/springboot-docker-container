FROM eclipse-temurin:17

LABEL maintainer="egorlins@hotmail.com"

WORKDIR /app

COPY target/spring-boot-docker-demo-0.0.1-SNAPSHOT.jar /app/springboot-docker-demo.jar

ENTRYPOINT ["java", "-jar", "springboot-docker-demo.jar"]

#build
#maven clean package

#D:\Git\spring-boot-docker-demo>docker build -t springboot-docker-demo .

#build with tag
#D:\Git\spring-boot-docker-demo>docker build -t springboot-docker-demo:0.1.RELEASE .

#see current images
#D:\Git\spring-boot-docker-demo>docker images
#REPOSITORY               TAG           IMAGE ID       CREATED          SIZE
#springboot-docker-demo   0.1.RELEASE   f2176a91725d   20 seconds ago   474MB
#springboot-docker-demo   latest        f2176a91725d   20 seconds ago   474MB

#-p is port mapping host:container, we should expose and map ports
# running container
#D:\Git\spring-boot-docker-demo>docker run -p 8081:8080

#http://localhost:8081/docker

#C:\Users\Jegor>docker ps
#CONTAINER ID   IMAGE                    COMMAND                  CREATED          STATUS          PORTS                    NAMES
#679a2cc92ace   springboot-docker-demo   "java -jar springboo…"   22 seconds ago   Up 22 seconds   0.0.0.0:8081->8080/tcp   determined_pike


#-p is port mapping host:container, we should expose and map ports
#-d detached mode
# running container
#D:\Git\spring-boot-docker-demo>docker run -p 8081:8080 -d springboot-docker-demo
#17f4643922d1a9592474cbd0f9850fbb2ed989c95b2155fbde62ca958b282001
#to see logs taking firsh chars of returned docker id
#D:\Git\spring-boot-docker-demo>docker logs -f 17f4

#to stop detacher
#D:\Git\spring-boot-docker-demo>docker stop 17f4

###
#publishing
###

#docker login
#docker tag springboot-docker-demo egorlins/springboot-docker-demo:0.1.Release
#
#docker images
#REPOSITORY                        TAG           IMAGE ID       CREATED          SIZE
#egorlins/springboot-docker-demo   0.1.Release   f2176a91725d   20 minutes ago   474MB
#springboot-docker-demo            0.1.RELEASE   f2176a91725d   20 minutes ago   474MB
#springboot-docker-demo            latest        f2176a91725d   20 minutes ago   474MB
#
#docker push egorlins/springboot-docker-demo:0.1.Release

###
#pulling from docker hub
###


#D:\Git\spring-boot-docker-demo>docker pull egorlins/springboot-docker-demo:0.1.Release
#0.1.Release: Pulling from egorlins/springboot-docker-demo
#Digest: sha256:f8047a15e81df5709da393c7f18121fcce50a3060fd7ea24de62dfda879939eb
#Status: Image is up to date for egorlins/springboot-docker-demo:0.1.Release
#docker.io/egorlins/springboot-docker-demo:0.1.Release
#
#D:\Git\spring-boot-docker-demo>docker images
#REPOSITORY                        TAG           IMAGE ID       CREATED          SIZE
#springboot-docker-demo            0.1.RELEASE   f2176a91725d   25 minutes ago   474MB
#springboot-docker-demo            latest        f2176a91725d   25 minutes ago   474MB
#egorlins/springboot-docker-demo   0.1.Release   f2176a91725d   25 minutes ago   474MB
#
#D:\Git\spring-boot-docker-demo>docker pull mysql:latest
#
#D:\Git\spring-boot-docker-demo>docker images
#REPOSITORY                        TAG           IMAGE ID       CREATED          SIZE
#egorlins/springboot-docker-demo   0.1.Release   f2176a91725d   27 minutes ago   474MB
#springboot-docker-demo            0.1.RELEASE   f2176a91725d   27 minutes ago   474MB
#springboot-docker-demo            latest        f2176a91725d   27 minutes ago   474MB
#mysql                             latest        483a8bc460a9   3 days ago       530MB

#D:\Git\spring-boot-docker-demo>docker run -p 3307:3306 --name localhost -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=employee_db -e MYSQL_USER=root2 -e MYSQL_PASSOWRD=root2 -d mysql:latest
#4848956b0e74207c92dff16c3216ae5e79704ad4dc6ae442792db13c57305d35

#D:\Git\spring-boot-docker-demo>docker logs -f localhost

## login to DB
#D:\Git\spring-boot-docker-demo>docker exec -it localhost bash
#
#bash-4.4# mysql -u root -p
#Enter password:
#
#Welcome to the MySQL monitor.  Commands end with ; or \g.
#Your MySQL connection id is 8
#Server version: 8.0.32 MySQL Community Server - GPL
#
#Copyright (c) 2000, 2023, Oracle and/or its affiliates.
#
#Oracle is a registered trademark of Oracle Corporation and/or its
#affiliates. Other names may be trademarks of their respective
#owners.
#
#Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
#
#mysql> show databases ;
#+--------------------+
#| Database           |
#+--------------------+
#| employee_db        |
#| information_schema |
#| mysql              |
#| performance_schema |
#| sys                |
#+--------------------+