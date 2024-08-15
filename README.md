# intdash ROS2Bridge Example

This is an example docker container environemnt for intdash ROS2Bridge.

## Demonstration

### Contents of the demo

This demonstration provide following upstreams for intdash.

- Upstream
  - String topic (name: /hello)
  - Poingcloud2 topic (name: /cube_points)
  - Image topic (name: /compressed_image)

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
