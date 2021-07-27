# Study Docker

## 1. Sign up & in Dockerhub
- [Jaehyun Shim's docker page](https://hub.docker.com/u/jshim)

## 2. Install
  ```sh
  # Install docker
  $ curl -fsSL https://get.docker.com/ | sudo sh

  # Grant root privileges
  $ sudo usermod -aG docker $USER # Reboot after this command

  # Check docker version
  $ docker version
  ```

## 3. Commands
  ```sh
  # Run
  $ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]

  (Options)
  -d     # detached mode (aka background mode)
  -p     # connect host and container port (forwarding)
  -v     # connect host and container directory (mount)
  -e     # set environment variables used in container
  –name  # set container name
  –rm    # remove container automatically when process ends
  -it    # option for terminal iuput (-i + -t)
  –link  # link container (container name: nickname..?)
  --net=host

  (Example)
  $ docker run --rm -it ubuntu:18.04 /bin/bash
  $ cat /etc/issue
  $ ls
  $ exit

  # Process Status
  $ docker ps [OPTIONS]
  $ docker ps -a

  # Stop
  $ docker stop [OPTIONS] CONTAINER [CONTAINER...]
  $ docker stop ${UBUNTU_CONTAINER_ID}

  # Restart
  $ docker start ${UBUNTU_CONTAINER_ID}
  $ docker attach ${UBUNTU_CONTAINER_ID}
  # Execute, giving commands to running containers
  $ docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
  $ docker exec -it ${UBUNTU_CONTAINER_ID} /bin/bash

  # Remove
  $ docker rm [OPTIONS] CONTAINER [CONTAINER...]
  $ docker rm ${UBUNTU_CONTAINER_ID} ${TENSORFLOW_CONTAINER_ID}
  $ docker rm -v $(docker ps -a -q -f status=exited)

  # Images
  $ docker images [OPTIONS] [REPOSITORY[:TAG]]
  $ docker images # get image ID

  # Pull
  $ docker pull [OPTIONS] NAME[:TAG|@DIGEST]
  $ docker pull ubuntu:18.04

  # Remove Image
  $ docker rmi [OPTIONS] IMAGE [IMAGE...]
  $ docker rmi ${UBUNTU_IMAGE_ID}

  # Log
  $ docker logs [OPTIONS] CONTAINER
  $ docker logs ${UBUNTU_CONTAINER_ID}
  $ docker logs --tail 10 ${UBUNTU_CONTAINER_ID}
  $ docker logs -f ${UBUNTU_CONTAINER_ID}
  ```

## 4. Docker Compose
  ```sh
  curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  docker-compose version

  # test
  $ vi docker-compose.yml (From the web)
  $ docker-compose up
  ```

## 5. Docker Image
  ```sh
  # Commit and Push
  $ docker commit ${UBUNTU_CONTAINER_ID} TARGET_IMAGE[:TAG]
  $ docker login
  $ docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
  $ docker push TARGET_IMAGE[:TAG]

  # Pull
  $ docker pull TARGET_IMAGE[:TAG]
  $ docker pull JaehyunShim/ros:melodic-ros-base-xenial

  # Build
  $ docker build [OPTIONS] PATH | URL | -
  $ docker build -t app .
  $ docker run -d -p 8080:4567 app
  ```

## 6. Example
- [Dockerfile](https://github.com/JaehyunShim/doodles/blob/master/Dockerfile)
- [Docker Image](https://hub.docker.com/r/jshim/ros/tags)
  ```sh
  # Run ROS Melodic Version
  $ docker run --net=host -p 6080:80 -p 5900:5900 -e USER=ubuntu -e VNC_PASSWORD=1111 -v /dev/shm:/dev/shm JaehyunShim/ros:melodic-ros-base-bionic
  # Run ROS2 Dashing Version
  $ docker run --net=host -p 6080:80 -p 5900:5900 -e USER=ubuntu -e VNC_PASSWORD=1111 -v /dev/shm:/dev/shm JaehyunShim/ros:dashing-ros2-base-bionic

  # Execute Docker Container
  $ docker exec -it ${UBUNTU_CONTAINER_ID} /bin/bash

  # Web (Ubuntu)
  http://localhost:6080
  # Remmina VNC (Ubuntu)
  localhost

  # Web (Mac)
  # Remove --net=host option! Doens't work!
  http://localhost:6080
  ```
- [ros2 docker tutorial](https://github.com/JaehyunShim/ros2_docker_tutorial)

## 7. Reference
- [docker for beginners](https://subicura.com/2017/01/19/docker-guide-for-beginners-1.html#%EB%8F%84%EC%BB%A4%EC%9D%98-%EC%97%AD%EC%82%AC)
- [docker network structure](https://bluese05.tistory.com/38?category=559611)
- [osrf/docker_images](https://github.com/osrf/docker_images)
- [docker network](https://bluese05.tistory.com/38?category=559611)
- [docker vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc)
- [docker for turtlebot3](https://github.com/ubtjoe/turtlebot3-docker)
