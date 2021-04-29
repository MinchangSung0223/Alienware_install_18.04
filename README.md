# GPU-VOXESL SETTING
1. Docker 설치
```bash
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker
 
    sudo usermod -aG docker $USER # 현재 접속중인 사용자에게 권한주기
    sudo usermod -aG docker your-user # your-user 사용자에게 권한주기

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2
```

2. 배포된 image를 다운로드 하는 방법
```bash 
     docker pull tjdalsckd/gpu_voxels:latest
```
또는 직접 빌드하는 방법.
```bash
    wget https://raw.githubusercontent.com/tjdalsckd/Alienware_install_18.04/main/Dockerfile
    docker build -t tjdalskcd/gpu_voxels:latest .
```
image가 다운로드 된 것을 확인
```bash
   docker images
``` 
![Screenshot from 2021-04-13 19-17-52](https://user-images.githubusercontent.com/53217819/114537392-1ca79a80-9c8d-11eb-8ed6-3e909425c52b.png)


3. 실행 
terminal1: 
```bash
xhost +local:root
 docker  run --rm -it --gpus all --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 tjdalskcd/gpu_voxels:latest bash

```



terminal2:
```bash
 docker ps
```



![Screenshot from 2021-04-13 19-18-45](https://user-images.githubusercontent.com/53217819/114537435-27622f80-9c8d-11eb-8363-7364b543bbb2.png)

해당하는 컨테이너 아이디를 확인한 뒤 다음의 명령어를 입력.
```bash
 docker exec -it CONTAINER_ID bash
```

4. docker 내부
terminal 1:
```bash
  cd ~/workspace/gpu-voxels/build/bin
  ./gpu_voxels_visualizer
```
![terminal1](https://user-images.githubusercontent.com/53217819/114537821-9cce0000-9c8d-11eb-9375-8f65a507ae6c.png)
terminal 2:
```bash
cd ~/workspace/gpu-voxels/build/bin
./collisions
```

![terminal2](https://user-images.githubusercontent.com/53217819/114537827-9f305a00-9c8d-11eb-9d84-ea25796fa230.png)


1. terminator를 이용하여 여러개의 터미널 세팅

```bash
sudo apt-get install terminator
gedit ~/.config/terminator/config
```
 4개의 분할된 터미널세팅값
```bash
[global_config]
[keybindings]
[layouts]
  [[default]]
    [[[child0]]]
      fullscreen = False
      last_active_term = 4c3448a7-9e67-4c0b-8cec-32f20ade34ba
      last_active_window = True
      maximised = False
      order = 0
      parent = ""
      position = 87:71
      size = 1194, 873
      title = sung@sung: ~
      type = Window
    [[[child1]]]
      order = 0
      parent = child0
      position = 432
      ratio = 0.498281786942
      type = VPaned
    [[[child2]]]
      order = 0
      parent = child1
      position = 594
      ratio = 0.5
      type = HPaned
    [[[child5]]]
      order = 1
      parent = child1
      position = 594
      ratio = 0.5
      type = HPaned
    [[[terminal3]]]
      order = 0
      parent = child2
      profile = default
      type = Terminal
      uuid = d79d1e73-3e8c-4ccf-bb38-d018e744b0a2
    [[[terminal4]]]
      order = 1
      parent = child2
      profile = default
      type = Terminal
      uuid = 4c3448a7-9e67-4c0b-8cec-32f20ade34ba
    [[[terminal6]]]
      order = 0
      parent = child5
      profile = default
      type = Terminal
      uuid = 25b4eafc-bbf7-4182-b72d-eed09abad176
    [[[terminal7]]]
      order = 1
      parent = child5
      profile = default
      type = Terminal
      uuid = 3b9d5f26-9996-4535-89fd-bfa7c42b4965
[plugins]
[profiles]
  [[default]]
    background_image = None
```

![Screenshot from 2021-04-14 10-30-45](https://user-images.githubusercontent.com/53217819/114641133-7dc28300-9d0c-11eb-86dd-d6a30fc661da.png)

2. 각각의 환경에서 Docker  환경접속
terminal1
```bash
     xhost +local:root
 docker  run --rm -it --gpus all --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 tjdalskcd/gpu_voxels:latest bash
```
terminal2
```bash
          xhost +local:root
docker exec -it CONTAINER_ID bash
```
terminal3
```bash
               xhost +local:root
docker exec -it CONTAINER_ID bash
```
terminal4
```bash
               xhost +local:root
docker exec -it CONTAINER_ID bash
```
![ddd](https://user-images.githubusercontent.com/53217819/114642151-5967a600-9d0e-11eb-8353-9cc618563d73.png)


3. Container 외부의 ROS환경과의 연결

terminal2
```bash
  exit
roscore
```

terminal1
```bash
  rviz

```

terminal3
```bash
rostopic list
```
terminal4
```bash

```
![dfdf](https://user-images.githubusercontent.com/53217819/114642828-82d50180-9d0f-11eb-8d94-a861c5c9f369.png)

4. Docker 외부에서 realsense 카메라를 실행하고 Docker 내부에서 확인

terminal3
```bash
 exit
roslaunch realsense2_camera demo
```
terminal4
```bash
   rviz
```
![rvizzz](https://user-images.githubusercontent.com/53217819/114643418-9339ac00-9d10-11eb-9f47-9a604fc952a4.png)

5.  Docker 외부에서 Moveit을 실행한 뒤 Docker 내부에서 topic 확인
![moveittest](https://user-images.githubusercontent.com/53217819/114644035-b87aea00-9d11-11eb-9920-d490f6f8b827.png)

6. gvl_ompl_planner build teset
```bash
conda activate ros
apt-get install ros-kinetic-ompl;
cd ~/workspace/gpu-voxels/build;
cmake ..
make -j16
cd ~/workspace/gpu-voxles/gvl_ompl_planning;
cmake .. -D icl_core_DIR=~/workspace/gpu-voxels/build/packages/icl_core/
-D gpu_voxels_DIR=~/workspace/gpu-voxels/build/packages/gpu_voxels;
make -j16
```
7. panda_sim test
```bash
git clone https://github.com/tjdalsckd/gpu_voxel_panda_sim

cd gpu_voxel_panda_sim
cmake . -D icl_core_DIR=/root/workspace/gpu-voxels/build/packages/icl_core/ -D gpu_voxels_DIR=/root/workspace/gpu-voxels/build/packages/gpu_voxels;

make -j16
```
L
