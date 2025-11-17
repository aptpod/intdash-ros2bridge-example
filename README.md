# intdash ROS2Bridge Example

This is an example docker container environemnt for intdash ROS2Bridge.

## Demonstration

### Contents of the demo

This demonstration provide following upstreams and downstreams for intdash.

- Upstream
  - String topic (name: /hello)
  - Poingcloud2 topic (name: /cube_points)
  - Image topic (name: /compressed_image)
  - String topic from sample rosbag (name: /rosbag_test)
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

### Playing rosbag and streaming it upstream

Place the rosbag directory under the directory where docker-compose.yml is located.
In the ros2_bag service configuration in docker-compose.yml, mount the path corresponding to the directory as a Docker volume.

Configuration example:

```
  ros2_bag:
    (omitted)
    volumes:
     - ./services/ros2_bag/data/$ROS2_DISTRO/sample:/tmp/rosbag
    command: |
      bash -c "source /opt/ros/$ROS2_DISTRO/setup.bash &&
               stdbuf -o0 ros2 bag play --loop /tmp/rosbag"
```

### About downstream functionality

An example node that receives downstream joy topics from Data Visualizer's controller parts is provided.
The following files contain related configurations and implementations:

- `/services/agent2/agent2_config.yml`
- `/services/bridge/ros2bridge_config.yml`
- `services/ros2_demo/docker/src/ros2_demo/ros2_demo/pointcloud2_pub.py`

## Customize Docker environment for intdash ROS Bridge

### Add custom message types to intdash ROS Bridge and use non-standard messages in rosbag

If you want to add custom message which are not included in ROS base Docker image, there are 2 methods.

#### method 1 : rebuild intdash ROS2Bridge with your custom message definition

Rebuild Docker images with your custom message definition based on `public.ecr.aws/aptpod/intdash-ros2bridge`.

Dockerfile example : `assets/custom_msg_with_bridge.Dockerfile`

#### method 2 : install intdash ROS2Bridge into your custom Docker image

Install intdash ROS2Bridge into your custom Docker image by apt tool. Please refer Aptpod official documents how to install intdash ROS2Bridge.

Dockerfile example : `assets/your_ros_nodes_with_bridge.Dockerfile`

#### Extending the ros2_bag service

The Docker image used as the base for ros2_bag only contains standard message definitions. If you want to include non-standard messages, you need to edit `services/ros2_bag/Dockerfile` according to the intdash ROS2Bridge configuration above, and install or build the necessary message packages.

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

