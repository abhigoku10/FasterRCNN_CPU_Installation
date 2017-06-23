

##to run on CPU enable the cpu mode and with python layer (i.e uncomment the line)
# Compile caffe and pycaffe
#Perform the following changes in the makefile.config




# In your Makefile.example.config, make sure to have these lines uncommented

 #Line 87
WITH_PYTHON_LAYER := 1

# Line 7
# CPU-only switch (uncomment to build without GPU support). 
 CPU_ONLY := 1

#Line 20
# Uncomment if you're using OpenCV 3. #Line20
 OPENCV_VERSION := 3

# In your Makefile.example.config, make sure to have these lines commented as show below##

# Unrelatedly, it's also recommended that you use CUDNN
# USE_CUDNN := 1

##Line 35
# CUDA architecture setting: going with all of them.
# For CUDA < 6.0, comment the *_50 lines for compatibility.
#CUDA_ARCH := -gencode arch=compute_20,code=sm_20 \
#		-gencode arch=compute_20,code=sm_21 \
#		-gencode arch=compute_30,code=sm_30 \
#		-gencode arch=compute_35,code=sm_35 \
#		-gencode arch=compute_50,code=sm_50 \
#		-gencode arch=compute_50,code=compute_50

# In your Makefile.example.config, make sure to add these paths as mentioned below 

##Line 89
# in the makefile  add opencv_imgcodecs into the LIBRARIES line  and include the opencv 
 LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu/hdf5/serial /home/adminvatm/opencv/build/lib

 INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/

cp Makefile.config.example Makefile.config


#cd ..
sudo make all 
###error 1
### this is to create a symbolic link bewteen files 
#cd /usr/lib/aarch64-linux-gnu
#sudo ln -s libhdf5_serial.so.10 libhdf5.so
#sudo ln -s libhdf5_seria_hl.so.10 libhdf5_hl.so




sudo make test

# Make Test Error 1 
# src/caffe/test/test_smooth_L1_loss_layer.cpp:11:35: fatal error: caffe/vision_layers.hpp Comment the following line 
#include "caffe/vision_layers.hpp" in the following path py-faster-rcnn/caffe-fast-rcnn/src/caffe/test

##Make Test Error 2
#once make all is completed rename the test_roi_pooling_layer.cpp into test_roi_pooling_layer.cpp.org in the following path py-faster-rcnn/caffe-fast-rcnn/src/caffe/test




sudo make runtest
sudo make pycaffe 





