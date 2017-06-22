
#!/bin/bash
# This script install setup the Faster RCNN on the system

sudo apt-get -y install python cython 

#Go to the lib folder of the fasterRCNN cd $FRCN_ROOT/lib
sudo make

# run the script or command to download the models of vgg16 and zf 
cd $FRCN_ROOT
./data/scripts/fetch_faster_rcnn_models.sh

#This successfully installs the Faster RCNN on the system 

#TO run the demo and check the timing take by system first edit the demo file 
cd $FRCN_ROOT
./tools/demo.py
#to run demo on cpu mode and using model zf
python demo.py --cpu --net 'zf'



#####Error 1
# going to /FRCNN/py-faster-rcnn/lib/fast_rcnn/nms_wrapper.py and changing the code as follows:
# from fast_rcnn.config import cfg
# #from nms.gpu_nms import gpu_nms
# from nms.cpu_nms import cpu_nms

# def nms(dets, thresh, force_cpu=False):
    # """Dispatch to either CPU or GPU NMS implementations."""

    # if dets.shape[0] == 0:
        # return []
    # #if cfg.USE_GPU_NMS and not force_cpu:
    # #    return gpu_nms(dets, thresh, device_id=cfg.GPU_ID)
    # else:
        # return cpu_nms(dets, thresh)
		

# #####Error 2		
# Set USE_GPU_NMS in ./lib/fast_rcnn/config.py (or your YAML file) to False.
# In ./tools/test_net.py / train_net.py, replace caffe.set_mode_gpu() with caffe_set_mode_cpu().
