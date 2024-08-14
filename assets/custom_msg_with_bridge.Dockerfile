ARG ROS_DIST=humble
FROM public.ecr.aws/aptpod/intdash-ros2bridge:${ROS_DIST}
ARG ROS_DIST=humble

COPY ./my_msgs /ws/src/my_msgs

WORKDIR /ws

RUN bash -c "source /opt/ros/$ROS_DIST/setup.bash && colcon build" 

# do "source /ws/install/setup.bash" before run intdash ROS2Bridge 
