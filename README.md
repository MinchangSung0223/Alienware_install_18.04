# Alienware_install_18.04
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
     docker pull tjdalskcd/gpu_voxels:latest2
```
또는 직접 빌드하는 방법.
```bash
    wget https://raw.githubusercontent.com/tjdalsckd/Alienware_install_18.04/main/Dockerfile
    docker build -t tjdalskcd/gpu_voxels:latest2 .
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
 docker  run --rm -it --gpus all --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 tjdalskcd/gpu_voxels:latest2 bash

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
