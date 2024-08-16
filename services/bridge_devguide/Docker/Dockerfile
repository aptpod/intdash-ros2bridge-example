ARG ROS2_DISTRO=humble
ARG BRIDGE_VERSION=v1.4.0
FROM public.ecr.aws/aptpod/intdash-ros2bridge:${ROS2_DISTRO}-${BRIDGE_VERSION}
ARG ROS2_DISTRO=humble

RUN apt-get update && apt-get install -y \
  ros-${ROS2_DISTRO}-examples-* \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
