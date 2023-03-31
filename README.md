# forward
Tools to quickly launch and forward Sherlock jobs (such as jupyter) and forward a port to local machine.

# Setup
`params.sh` defines all the important job parameters. Take a look and modify as you need.
Make sure to change the `FORWARD_USERNAME`.

# SSH config
Add the following to your `~/.ssh/config`. This can reduce the number of times you need to authenticate.
```
Host sherlock
    User put_your_username_here
    Hostname sh-ln01.stanford.edu  # ssh into login node, and copy the node name here 
    GSSAPIDelegateCredentials yes
    GSSAPIAuthentication yes
    ControlMaster auto
    ControlPersist yes
    ControlPath ~/.ssh/%l%r@%h:%p
```

# Usage
## Jupyter notebook
`sbatches/sherlock/py3-jupyter.sbatch` defines how a jupyter notebook is lauched on a compute node. You might want to change the last few lines to load your own conda environment (I don't have to do it because I activate my conda environment in the ~/.bachrc on sherlock). The `_resubmit` function is to automatically restart your job if it runs out of time.

Comands to launch and stop jupyter notebook:
```
# Start notebook
bash start.sh py3-jupyter jupyter_notebook_working_directory

# Stop notebook
bash end.sh py3-jupyter

# Resume connection to notebook (e.g. after network disconnection)
bash resume.sh py3-jupyter
```

If you want to ssh into the compute node that runs the jupyter notebook
```
# On login node
ssh `squeue --name=py3-jupyter --user=stfan -o %N -h`
```

## Tensorboard
I like to reuse the jupyter notebook compute node for tensorboard. What I do is:
- ssh into the compute node
- Start a tmux session
- Run tensorboard, with the option `--port 50002`
- On local computer, go to the forward folder and run `bash resume.sh py3-jupyter 50002`
- Access `http://localhost:50002`

