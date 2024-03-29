FORWARD_USERNAME="stfan"    # Sherlock ssh user id
PORT="50001"                # ssh forwarding port
PARTITION="shenoy"          # Sherlock partition
RESOURCE="sherlock"         # ssh host for sherlock login node
MEM="64GB"                  # compute node memory
TIME="167:59:59"            # compute node time
CPU="8"                     # compute node cpus
#GPU="1"                    # compute node gpus
#CONSTRAINTS="[GPU_MEM:40GB|GPU_MEM:32GB|GPU_MEM:24GB]"  # compute node gpu constraints
SIGNAL="B:SIGUSR1@90"       # Signal to send when job is about to end
MAIL_TYPE="ALL"             # Mail types to send
#CONTAINERSHARE="/scratch/users/stfan/share"
