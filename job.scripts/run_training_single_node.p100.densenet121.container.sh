#!/bin/bash
#SBATCH -J densenet121.amp.p100.container
#SBATCH -o o.%x.%j
#SBATCH -e e.%x.%j
#SBATCH -p gpu
#SBATCH --gres=gpu:2
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -A scw1001
#SBATCH -t 12:00:00

set -eu

module purge
module load singularity
module list

IMAGEPATH=/scratch/c.c1045890/dl.examples/pytorch/nvidia.ngc.containers
IMAGENAME=pytorch-22.03-py3
WORKDIR=/scratch/c.c1045890/dl.examples/pytorch/examples/imagenet/outputs/densenet121/$SLURM_JOB_ID
rm -rf $WORKDIR
mkdir -p $WORKDIR

code="main_amp.py"

cp $code $WORKDIR

cd $WORKDIR
env
time singularity run --nv ${IMAGEPATH}/${IMAGENAME} python3 -u -m \
    torch.distributed.launch --nproc_per_node=2 $code \
    -a densenet121 \
    --batch-size 128 \
    --workers 8 \
    --epochs 3 \
    --print-freq 100 \
    --opt-level O1 \
    /scratch/c.c1045890/dl.examples/pytorch/examples/imagenet/rawdata
