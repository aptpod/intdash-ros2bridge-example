# intdash ROS2Bridge Example

This is an example docker container environemnt for intdash ROS2Bridge.

## Demonstration

### Contents of the demo

This demonstration provide following upstreams and downstreams for intdash.

- Upstream
  - String topic (name: /hello)
  - Poingcloud2 topic (name: /cube_points)
  - Image topic (name: /compressed_image)
- Downstream
  - Any topic
    - You can manipulate the center coordinates of /cube_points using the axes[0] and axes[1] of the /joy topic.

ROS2 is supported.

A data settings file for Data Visualizer (`assets/intdash-ROS-Example.dat`) is provided for your verification.

### Preparation

#### Precondition

Docker and Docker compose are required.

#### Modify .env

Open and edit .env file.

Set each variables to meet your condition.

### Build Docker image

Run following command.

```
docker compose build
```

### Execute ROS2 demo

Run following command.

```
docker compose up
```

## Customize Docker environment for intdash ROS Bridge

### Add custom message types to intdash ROS Bridge

If you want to add custom message which are not included in ROS base Docker image, there are 2 methods.

#### method 1 : rebuild intdash ROS2Bridge with your custom message definition

Rebuild Docker images with your custom message definition based on `public.ecr.aws/aptpod/intdash-ros2bridge`.

Dockerfile example : `assets/custom_msg_with_bridge.Dockerfile`

#### method 2 : install intdash ROS2Bridge into your custom Docker image

Install intdash ROS2Bridge into your custom Docker image by apt tool. Please refer Aptpod official documents how to install intdash ROS2Bridge.

Dockerfile example : `assets/your_ros_nodes_with_bridge.Dockerfile`

### Update configuration for intdash Edge Agent2

If you want to change agent config, please edit `service/agent/agent2_config.yml`.

Please refer Aptpod official documents how to configure intdash Edge Agent2.

## Configuration for developer's guide

After editing edge1.env and edge2.env, as well as the src_edge_uuid in service/agent2/agent2_config_edge1.yml and service/agent2/agent2_config_edge2.yml, execute the following commands.

By executing the command, you can test the ROS2 commands on the intdash ROS2Bridge container.

### Edge device 1

```
$ docker compose -f docker-compose-edge1.yml --env-file edge1.env -p edge1 up -d
$ docker exec -it  edge1-intdash_ros2bridge-1 bash

# source /opt/ros/humble/setup.bash 
```

### Edge device 2

```
$ docker compose -f docker-compose-edge2.yml --env-file edge2.env -p edge2 up -d
$ docker exec -it  edge2-intdash_ros2bridge-1 bash

# source /opt/ros/humble/setup.bash 
```

