FROM ubuntu:latest
RUN apt-get update
RUN apt install openjdk-17-jdk openjdk-17-jre -y
RUN java -version
RUN apt-get -y install git
RUN git -version
