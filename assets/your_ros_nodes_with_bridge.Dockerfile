ARG ROS_DIST=humble
FROM ros:${ROS_DIST}

ENV DEBIAN_FRONTEND=noninteractive

ARG ARCHITECTURE=amd64
ARG ROS_DIST=humble

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  lsb-release \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -s --compressed \
 "https://repository.aptpod.jp/intdash-robotics/linux/ubuntu/gpg" | apt-key add -

RUN echo "deb [arch=${ARCHITECTURE}] \
  https://repository.aptpod.jp/intdash-robotics/linux/ubuntu \
  $(lsb_release -cs) \
  stable" \
 | tee /etc/apt/sources.list.d/intdash-robotics.list

RUN apt-get update && apt-get install -y ros-$ROS_DIST-intdash-ros2bridge gstreamerproxy \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add your installation script 
