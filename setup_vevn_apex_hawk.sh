#!/bin/bash
# Automatic build script
# Be defensive
set -eu
# Copy output to file for reference.
exec > >(tee -i apex-logfile-`date +'%Y%m%d-%H%M%S'`.txt)
exec 2>&1

module purge
module load compiler/gnu/7
module load python/3.7.0
module load CUDA/10.2
module list

unset PYTHONPATH
export PIP_NO_CACHE_DIR=off
export ENVPATH=/scratch/c.c1045890/dl.examples/pytorch/apex-venv
export ENVNAME=apex-hawk-venv

python3.7 -m venv --prompt $ENVNAME --clear $ENVPATH

$ENVPATH/bin/pip install --upgrade pip
$ENVPATH/bin/pip --version

$ENVPATH/bin/pip install torch torchvision torchaudio

#git clone https://github.com/NVIDIA/apex
cd apex
$ENVPATH/bin/pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
