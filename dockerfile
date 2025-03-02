FROM nvidia/cuda:12.6.1-base-ubuntu24.04

#set bash as default shell
SHELL ["/bin/bash", "-c"]
# install ros2 jazzy
RUN apt update -y && apt install locales -y
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt install -y software-properties-common

RUN apt install -y software-properties-common \
    && add-apt-repository universe -y

RUN apt update -y && apt install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update -y && apt install -y ros-dev-tools
RUN apt install -y python3-colcon-common-extensions
RUN apt update -y &&\
    apt upgrade -y &&\
    apt install ros-jazzy-desktop -y
COPY .bashrc /root/.bashrc
RUN source /root/.bashrc
#end of ros2 jazzy installation

#install gz-harmonic
RUN apt install -y ros-jazzy-gz-*

# clone the your repo to start the development


