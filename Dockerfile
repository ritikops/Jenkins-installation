# Use the official Ubuntu 20.04 image as the base image
FROM ubuntu:20.04

# Set environment variables to disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
       wget \
       gnupg \
       fontconfig \
       openjdk-17-jre \
       systemctl \
    && wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
    && echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list \
    && apt-get update \
    && apt-get install -y jenkins \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose Jenkins default port
EXPOSE 8080

# Start Jenkins service
CMD ["/bin/bash", "-c", "service jenkins start && tail -f /var/log/jenkins/jenkins.log"]
