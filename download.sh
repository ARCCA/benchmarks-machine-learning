#!/bin/bash

set -eu


LINKS=(
# Development Kit
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_devkit_t12.tar.gz
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_devkit_t3.tar.gz
# Images
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_train.tar
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_train_t3.tar
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_val.tar
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_test_v10102019.tar

# Bounding Boxes
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_bbox_train_v2.tar.gz
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_bbox_train_dogs.tar.gz
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_bbox_val_v3.tgz
http://image-net.org/data/ILSVRC/2012/ILSVRC2012_bbox_test_dogs.zip
)

for i in ${LINKS[@]};
do
    #echo wget $i
    wget $i
done
