#!/bin/bash
# This script installs Caffe and python prerequisites on Ubuntu 16.04 x64.

set -e

sudo apt-get update
sudo apt-get upgrade



sudo apt-get -y install  libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev && sudo apt-get install -y --no-install-recommends libboost-all-dev && sudo apt-get install -y libatlas-base-dev && sudo apt-get install -y python-dev && sudo apt-get install -y python-pip git && sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

# More pre-requisites if not Installed from PrePackages file 
sudo apt-get install -y cmake unzip doxygen
sudo apt-get install -y protobuf-compiler
sudo apt-get install -y libffi-dev python-dev build-essential
sudo pip install lmdb
sudo pip install numpy
sudo apt-get install -y python-numpy
sudo apt-get install -y gfortran # required by scipy
sudo pip install scipy # required by scikit-image
sudo apt-get install -y python-scipy # in case pip failed
sudo apt-get install -y python-nose
sudo apt-get install -y python-tk
sudo apt-get install -y libopenblas-dev
sudo apt-get install python-skimage # to fix https://github.com/BVLC/caffe/issues/50

# For Ubuntu 14.04
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler 




