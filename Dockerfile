FROM ubuntu:latest
RUN apt-get update
RUN apt install openjdk-17-jdk openjdk-17-jre -y
RUN java -version
RUN apt-get -y install git
RUN git -version

# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Set non-interactive mode during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    git \
    maven \
	unzip \
    wget


RUN wget https://github.com/sridharlovevirus/docker/archive/refs/heads/main.zip

RUN unzip main.zip

# Change directory to the cloned repo
WORKDIR /docker-main

# Build the Spring Boot project using Maven
RUN mvn clean install

# Expose port 8080
EXPOSE 8080

RUN  ls -l target/

RUN chmod 777 target/helloworld-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/helloworld-0.0.1-SNAPSHOT.jar"]
