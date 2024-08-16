# intdash ROS2Bridgeの例

これは、intdash ROS2Bridge用のDockerコンテナ環境の例です。

## デモンストレーション

### デモの内容

このデモは、intdashを用いた以下のアップストリームを提供します。

- アップストリーム
  - Stringトピック (名前: /hello)
  - Pointcloud2トピック (名前: /cube_points)
  - 画像トピック (名前: /compressed_image)

ROS2に対応しています。

Data Visualizer用で確認される際は、データ設定ファイル (`assets/intdash-ROS-Example.dat`) を利用ください。

### 準備

#### 前提条件

DockerとDocker Composeが必要です。

#### .envの修正

.envファイルを開いて編集します。

各変数を条件に合わせて設定してください。

### Dockerイメージのビルド

以下のコマンドを実行します。

```
docker compose build
```

### ROS2デモの実行

以下のコマンドを実行します。

```
docker compose up
```

## intdash ROS BridgeのためのDocker環境のカスタマイズ

### intdash ROS Bridgeにカスタムメッセージタイプを追加

ROSベースのDockerイメージに含まれていないカスタムメッセージを追加したい場合、2つの方法があります。

#### 方法1 : カスタムメッセージ定義を使ってintdash ROS2Bridgeを再ビルド

カスタムメッセージ定義に基づいてDockerイメージを再ビルドします。ベースイメージは `public.ecr.aws/aptpod/intdash-ros2bridge` を使用します。

Dockerfileの例: `assets/custom_msg_with_bridge.Dockerfile`

#### 方法2 : カスタムDockerイメージにintdash ROS2Bridgeをインストール

aptツールを使用してカスタムDockerイメージにintdash ROS2Bridgeをインストールします。intdash ROS2Bridgeのインストール方法については、Aptpodの公式ドキュメントを参照してください。

Dockerfileの例: `assets/your_ros_nodes_with_bridge.Dockerfile`

### intdash Edge Agent2の設定を更新

エージェント設定を変更する場合は、`service/agent2/agent2_config.yml` を編集してください。

intdash Edge Agent2の設定方法については、Aptpodの公式ドキュメントを参照してください。

## 開発者向けガイドの設定

`edge1.env`と`edge2.env`および、`service/agent2/agent2_config_edge1.yml`と`service/agent2/agent2_config_edge2.yml`の`src_edge_uuid`を編集したのち、次のコマンドを実行します。

### エッジデバイス1

``` 
$ docker compose -f docker-compose-edge1.yml --env-file edge1.env -p edge1 up -d
$ docker exec -it  edge1-intdash_ros2bridge-1 bash

# source /opt/ros/humble/setup.bash 
```

### エッジデバイス2

```
$ docker compose -f docker-compose-edge2.yml --env-file edge2.env -p edge2 up -d
$ docker exec -it  edge2-intdash_ros2bridge-1 bash

# source /opt/ros/humble/setup.bash 
```
