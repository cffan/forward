#!/bin/bash
#SBATCH --mem=4GB
#SBSTCH --cpus-per-task=1


PORT=$1
TENSORBOARD_DIR=$2

tensorboard --logdir $TENSORBOARD_DIR --port=$PORT
