# benchmarks-machine-learning

This repository holds a few files used to run a series of benchmarks tests on SCW
GPUs. The test code is based on Pytorch and uses NVIDIA's APEX (https://github.com/nvidia/apex).

For now benchmarks are limited to image classication using ImageNet dataset

# Dataset

The Dataset can be download from ImageNet main website (account required): https://image-net.org/download-images.php
Specifically, I'm using: **ImageNet Large Scale Visual Recognition Challenge 2012 (ILSVRC2012)**

List of files in dataset

  20M  ILSVRC2012_bbox_train_v2.tar.gz
 2.2M  ILSVRC2012_bbox_val_v3.tgz
 2.5M  ILSVRC2012_devkit_t12.tar.gz
  22M  ILSVRC2012_devkit_t3.tar.gz
  13G  ILSVRC2012_img_test_v10102019.tar
 728M  ILSVRC2012_img_train_t3.tar
 138G  ILSVRC2012_img_train.tar
 6.3G  ILSVRC2012_img_val.tar
 489K  synset_labels.txt
