
#!/bin/bash
# This script install caffe after the pre-requisites have been installed
set -e

##GO TO THE caffe_rcnn folder in the faster_rcnn directory 

##to download caffe from the website 
#cd ../../Caffe-Master
#wget https://github.com/BVLC/caffe/archive/master.zip
#unzip -o caffe-master.zip
#cd caffe-master

# Prepare Python binding (pycaffe)
cd python
for req in $(cat requirements.txt); do sudo pip install $req; done
echo "export PYTHONPATH=$(pwd):$PYTHONPATH " >> ~/.bashrc # to be able to call "import caffe" from Python after reboot
source ~/.bashrc # Update shell 
cd ..

sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev


### to inside the caffe_faster_rcnn and install the remaining libraries 

# glog
wget https://github.com/google/glog/archive/v0.3.3.tar.gz
tar zxvf v0.3.3.tar.gz
cd glog-0.3.3
./configure
sudo make 
sudo  make install
# gflags
wget https://github.com/schuhschuh/gflags/archive/master.zip
unzip master.zip
cd gflags-master
mkdir build && cd build
export CXXFLAGS="-fPIC" && cmake .. && make VERBOSE=1
sudo make
sudo make install
# lmdb
git clone https://github.com/LMDB/lmdb
cd lmdb/libraries/liblmdb
sudo make
sudo make install






