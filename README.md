# Jenkins Docker Setup

This repository contains a `Dockerfile` to set up Jenkins on an Ubuntu 20.04 base image. It automates the installation of Jenkins and its dependencies, allowing you to quickly get a Jenkins instance up and running.

## Features

- Uses Ubuntu 20.04 as the base image.
- Installs Jenkins and its dependencies, including OpenJDK 17.
- Exposes Jenkins on the default port `8080`.
- Automatically starts the Jenkins service.

## Prerequisites

- Docker installed on your system. You can install it by following the [Docker documentation](https://docs.docker.com/get-docker/).

## How to Build and Run

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd dockerfile
   ```

2. Build the Docker image:
   ```bash
   docker build -t jenkins-setup .
   ```

3. Run the Docker container:
   ```bash
   docker run -p 8080:8080 -d jenkins-setup
   ```

4. Access Jenkins:
   - Open a browser and navigate to `http://<docker-host-ip>:8080`.
   - Retrieve the initial admin password from the container logs:
     ```bash
     docker logs <container-id>
     ```

## Folder Structure

```
.
├── Dockerfile    # Dockerfile to build the Jenkins image
├── README.md     # Project documentation
```

## Customization

- You can modify the `Dockerfile` to add plugins or additional configurations.
- Update the base image or Jenkins version if needed.

## Troubleshooting

- If Jenkins doesn't start, check the container logs:
  ```bash
  docker logs <container-id>
  ```

## License

This project is licensed under the MIT License. See the LICENSE file for details.
