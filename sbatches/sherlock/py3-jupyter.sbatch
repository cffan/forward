#!/bin/bash

PORT=$1
NOTEBOOK_DIR=${2:-${SCRATCH}}

# catch the SIGUSR1 signal
_resubmit() {
    ## Resubmit the job for the next execution
    echo "$(date): job $SLURM_JOBID received SIGUSR1 at $(date), re-submitting"
    scontrol requeue $SLURM_JOBID
}
trap _resubmit SIGUSR1

cd $NOTEBOOK_DIR

#module load py-jupyter/1.0.0_py36
ml load cudnn
jupyter lab --no-browser --port=$PORT &
wait
