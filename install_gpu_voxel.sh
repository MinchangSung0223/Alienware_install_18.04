#!/bin/bash

cd ~/libraries;
wget https://www.vtk.org/files/release/8.2/VTK-8.2.0.tar.gz &&
tar -zxvf VTK-8.2.0.tar.gz &&
cd VTK-8.2.0 &&
mkdir build &&
cd build &&
cmake .. &&
make -j16 &&
make install &&

cd ~/libraries;
sudo apt-get  install -y libudev-dev;
sudo apt-get install -y libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev libglfw3-dev libglfw3 ;
apt-get install -y openjdk-8-jre ;
apt-get install -y openjdk-8-jdk;
sudo apt-get install -y graphviz
cd ~/libraries;
git clone https://github.com/occipital/OpenNI2.git;
cd OpenNI2
make -j16;
sudo ln -s $PWD/Bin/x64-Release/libOpenNI2.so /usr/local/lib/;
sudo ln -s $PWD/Bin/x64-Release/OpenNI2/ /usr/local/lib/ ;
sudo ln -s $PWD/Include /usr/local/include/OpenNI2;
ldconfig

cd ~/libraries;

sudo apt-get install -y g++ cmake cmake-gui doxygen mpi-default-dev openmpi-bin openmpi-common libeigen3-dev libboost-all-dev libqhull* libusb-dev libgtest-dev git-core freeglut3-dev pkg-config build-essential libxmu-dev libxi-dev libusb-1.0-0-dev graphviz mono-complete qt-sdk libeigen3-dev;
sudo apt install -y libglew-dev;
sudo apt-get install -y libsqlite3-0 libpcap0.8  ;
sudo apt-get install -y libpcap-dev;

wget https://github.com/PointCloudLibrary/pcl/archive/pcl-1.9.1.tar.gz;
tar xvf pcl-1.9.1.tar.gz;

cd pcl-pcl-1.9.1;
mkdir build;
cd build;
cmake ..;
make -j16;
make install;

apt-get install -y cmake-qt-gui;
apt-get install -y libglew-dev;
apt-get install -y libglm-dev;
sudo apt-get install -y qt5-default;
mkdir -p ~/workspace;
cd ~/workspace;

apt-get install -y cmake-qt-gui;
apt-get install -y libglew-dev;
apt-get install -y libglm-dev;
sudo apt-get install -y qt5-default;
mkdir -p ~/workspace;
cd ~/workspace;

git clone https://github.com/fzi-forschungszentrum-informatik/gpu-voxels.git;
cd gpu-voxels;
mkdir build;
cd build;
cmake .. -D ENABLE_CUDA=True;
cd ~/workspace/gpu-voxels;
export GPU_VOXELS_MODEL_PATH=~/workspace/gpu-voxels/packages/gpu_voxels/models/;
