

##Execute the following commands 

#To keep the packages up to date 
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

#Download the master copy of Faster RCNN code from the following link 

git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git

#To install cython module 
sudo apt-get install  cython # for python 2.x users 
sudo apt-get install  cython3 # for python 3.x users 


# Comment the following lines inthe lib/setup.py  by locating each of these around the line number 

#CUDA = locate_cuda() ###line number 58

# use the cuda for .cu files    ###line number 90
            #self.set_executable('compiler_so', CUDA['nvcc'])
            # use only a subset of the extra_postargs, which are 1-1 translated
            # from the extra_compile_args in the Extension class

 #Extension('nms.gpu_nms',  					###line number 125
    #    ['nms/nms_kernel.cu', 'nms/gpu_nms.pyx'],
    #    library_dirs=[CUDA['lib64']],
    #    libraries=['cudart'],
    #    language='c++',
    #    runtime_library_dirs=[CUDA['lib64']],
        # this syntax is specific to this build system
        # we're only going to use certain compiler args with nvcc and not with
        # gcc the implementation of this trick is in customize_compiler() below
    #    extra_compile_args={'gcc': ["-Wno-unused-function"],
    #                        'nvcc': ['-arch=sm_35',
    #                                 '--ptxas-options=-v',
    #                                 '-c',
    #                                 '--compiler-options',
    #                                 "'-fPIC'"]},
    #    include_dirs = [numpy_include, CUDA['include']]
    #),

#Navigate to the lib folder of the downloaded faster rcnn location 
#cd $FRCN_ROOT/lib
sudo make -j $(nproc)


## Now execute the commands in the other script files to install the prequsites 

