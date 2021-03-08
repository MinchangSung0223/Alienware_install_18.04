#!/bin/bash
apt-get -y update;
apt-get -y upgrade;
sudo add-apt-repository -y ppa:graphics-drivers/ppa;
sudo apt -y  update;
sudo apt-get -y upgrade;
apt-get install -y nvidia-driver-455 &&
cd ~ &&
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux &&
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh &&
chmod 777 cuda_10.0.130_410.48_linux &&
chmod 777 Anaconda3-2020.11-Linux-x86_64.sh &&
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' &&
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 &&
sudo apt -y update &&
sudo apt -y upgrade &&
sudo apt-get install -y ros-melodic-desktop-full &&
sudo apt-get install -y python-pip &&

sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo pip install -U rosdep &&
sudo rosdep init &&
sudo rosdep update &&
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc ;
source ~/.bashrc ;
cd ~ ;
mkdir -p catkin_ws/src;
cd catkin_ws;
catkin_make ;
sudo apt-get -y install fcitx-hangul;
sudo apt-get -y install meshlab;
sudo apt-get -y install simplescreenrecorder;
sudo apt install -y gnome-tweaks

mkdir -p ~/libraries;
cd ~/libraries;
apt-get install -y libssl-dev ;
wget https://cmake.org/files/v3.18/cmake-3.18.0.tar.gz &&
tar -zxvf cmake-3.18.0.tar.gz &&
cd cmake-3.18.0 &&
./bootstrap &&
make -j16 &&
make install &&
cd ~/libraries &&
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.gz &&
tar xvf eigen-3.3.9.tar.gz &&
cd eigen-3.3.9 &&
mkdir build &&
cd build &&
cmake .. &&
make -j16 &&
make install &&
cd ~
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH"  >> ~/.bashrc ;
echo "export PATH=/usr/local/cuda/bin:$PATH" >> ~/.bashrc ;
source ~/.bashrc ;
init 3

