
##to run on CPU enable the cpu mode and with python layer (i.e uncomment the line)
# Compile caffe and pycaffe
#Perform the following changes in the makefile.config

# In your Makefile.config, make sure to have this line uncommented
WITH_PYTHON_LAYER := 1
# Unrelatedly, it's also recommended that you use CUDNN
#USE_CUDNN := 1

# in the makefile  add opencv_imgcodecs into the LIBRARIES line  and include the opencv 
# LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu/hdf5/serial /usr/local/share/OpenCV/3rdparty/lib/

# INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial
cp Makefile.config.example Makefile.config
#sed -i '8s/.*/CPU_ONLY := 1/' Makefile.config # Line 8: CPU only
#sed -i '33s/.*/BLAS := open/' Makefile.config # Line 33: to use OpenBLAS
# Note that if one day the Makefile.config changes and these line numbers change, we're screwed
# Maybe it would be best to simply append those changes at the end of Makefile.config 
#echo "export OPENBLAS_NUM_THREADS=($NUMBER_OF_CORES)" >> ~/.bashrc 
mkdir build
cd build
cmake ..

#cd ..
sudo make all 
###error 1
### this is to create a symbolic link bewteen files 
#cd /usr/lib/aarch64-linux-gnu
#sudo ln -s libhdf5_serial.so.10 libhdf5.so
#sudo ln -s libhdf5_seria_hl.so.10 libhdf5_hl.so



sudo make pycaffe 
sudo make test

# Make Test Error 1 
# src/caffe/test/test_smooth_L1_loss_layer.cpp:11:35: fatal error: caffe/vision_layers.hpp Comment the following line 
#include "caffe/vision_layers.hpp"
##Make Test Error 2
#once make all is completed rename the test_roi_pooling_layer.cpp into test_roi_pooling_layer.cpp.org
#once make all is completed comment the #include layers/vision_layer.hpp in the file and re-run


sudo make runtest
sudo make install


