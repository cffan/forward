#!/bin/bash
#SBATCH --job-name=matlab
#SBATCH --output=/home/users/stfan/forward-util/matlab.sbatch.out
#SBATCH --error=/home/users/stfan/forward-util/matlab.sbatch.err
#SBATCH --partition=normal
#SBATCH --time=8:00:00
#SBATCH --mem=20G

PORT=$1
NOTEBOOK_DIR=${2:-${SCRATCH}}

# catch the SIGUSR1 signal
_resubmit() {
    ## Resubmit the job for the next execution
    echo "$(date): job $SLURM_JOBID received SIGUSR1 at $(date), re-submitting"
    sbatch $0 $1 $2
}
trap _resubmit SIGUSR1

cd $NOTEBOOK_DIR

#module load py-jupyter/1.0.0_py36
ml matlab
matlab
