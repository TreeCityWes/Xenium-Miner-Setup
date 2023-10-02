# XenBlocks Xenium NVIDIA GPU Mining Setup Guide

This tutorial guides you through the process of setting up XenBlocks GPU mining using a cloud GPU miner on Ubuntu. Before diving into the script, ensure you have a basic understanding of user permissions and the `sudo` command in Linux. 

- **User Context:** 
    - Operations like installing, updating, or removing software require administrative privileges in Linux. By default, normal users don't have these privileges to ensure system security and integrity.
- **Understanding `sudo`:**
    - `sudo` stands for "superuser do," allowing a user to run commands with administrative privileges temporarily. When you prepend a command with `sudo`, you're telling the system to execute that command as the superuser (or an administrative user).
- **Permissions:**
    - Permissions dictate who can read, write, or execute files and directories. Make sure you are executing commands as a user that has permission. Scripts also need to be made executable to run them. For example, `sudo chmod +x build.sh` allows the `build.sh` script to be executable.

## Setting up XenBlocks GPU mining

The following section provides a list of commands to set up XenBlocks GPU mining on a machine running Ubuntu with an NVIDIA GPU. This is not a script to be run all at once, but a step-by-step guide meant to be followed in sequence. Each command is meant to be run individually in your terminal. Ensure you understand the purpose of each command before executing it, particularly if you are new to Linux or terminal commands. This setup primarily prepares your system by updating necessary packages, installing required tools, and setting up the XenBlocks GPU mining software. 


| Command | Description |
| ------- | ----------- |
| `sudo apt update && sudo apt upgrade -y` | Update package lists and upgrade installed packages. |
| `sudo apt install git cmake make sudo -y` | Install git, cmake, make, and sudo packages. |
| `sudo git clone https://github.com/shanhaicoder/XENGPUMiner.git` | Clone XenGPU Miner repository from GitHub. |
| `cd XENGPUMiner` | Change to the cloned XENGPUMiner directory. |
| `sudo apt-get install python3-pip` | Install pip for Python 3. |
| `sudo pip install -U -r requirements.txt` | Install required Python packages from requirements.txt. |
| `sudo apt install nano` | Install nano text editor. |
| `sudo apt install nvidia-cuda-toolkit` | Install NVIDIA CUDA toolkit. Not required if CUDA is already installed. Do not overwrite if prompted. |
| `sudo apt install ocl-icd-opencl-dev` | Install OpenCL development files. |
| `sudo nano config.conf` | Open config.conf file in nano for editing. |
| `sudo chmod +x build.sh` | Make the build.sh script executable. |
| `sudo ./build.sh -cuda_arch sm_(replace with your cards arch info)` | Run build.sh script with specified CUDA architecture flag. This creates the miner executable, xengpuminer. To get the architecture of your card, visit [NVIDIA CUDA GPUs](https://developer.nvidia.com/cuda-gpus#compute) |
| Setup complete! Run both ./xenminergpu and miner.py | I recommend using the TMUX script below.|

How to Setup TMUX

| Command | Description |
| ------- | ----------- |
| `sudo apt install tmux` | Install tmux terminal multiplexer. |
| `sudo nano tmux.sh` | Open a new or existing file named tmux.sh in nano for editing. |
| - | **Paste the script below into text editor and save. |(Ctrl+O to write changes, Ctrl+X to exit nano).** |
| `sudo chmod +x tmux.sh` | Make the tmux.sh script executable. |
| `sudo ./tmux.sh` | Execute the tmux.sh script. |


TMUX Script
```bash
#!/bin/bash

# Create a new tmux session, but don't attach to it yet
tmux new-session -d -s gpuminer

# Split the window horizontally
tmux split-window -v

# Run the Python miner command in the top pane (pane 0)
tmux send-keys -t gpuminer:0.0 'python3 miner.py --gpu=true' C-m

# Wait for 3 seconds
sleep 3

# Run the GPU miner command in the bottom pane (pane 1)
tmux send-keys -t gpuminer:0.1 './xengpuminer -b 128' C-m

# Finally, attach to the tmux session
tmux attach -t gpuminer
```

### Basic tmux Commands:

| Command       | Description                                       |
|---------------|---------------------------------------------------|
| `tmux`        | Starts a new tmux session                        |
| `tmux ls`     | Lists all tmux sessions                          |
| `tmux attach -t 0` | Attaches to tmux session 0                  |
| `Ctrl + b, "` | Splits the pane horizontally                     |
| `Ctrl + b, %` | Splits the pane vertically                       |
| `Ctrl + b, o` | Switches between panes                           |
| `Ctrl + b, c` | Creates a new window                             |
| `Ctrl + b, n` | Moves to the next window                         |
| `Ctrl + b, p` | Moves to the previous window                     |
| `Ctrl + b, d` | Detaches from the current tmux session           |
| `Ctrl + b, &` | Kills the current window                         |
| `Ctrl + b, x` | Kills the current pane                           |
| 'tmux kill-server' | Kills all open TMUX sessions

### Basic Linux Keyboard Commands:

| Command       | Description                                       |
|---------------|---------------------------------------------------|
| `Ctrl + C`    | Interrupts the current process/command           |
| `Ctrl + Z`    | Suspends the current process/command             |
| `Ctrl + D`    | Logs out of the current session                  |
| `Ctrl + L`    | Clears the terminal screen                       |
| `Ctrl + A`    | Moves the cursor to the beginning of the line    |
| `Ctrl + E`    | Moves the cursor to the end of the line          |
| `Ctrl + U`    | Deletes all characters before the cursor         |
| `Ctrl + K`    | Deletes all characters after the cursor          |


** More Xenium info at HashHead.io **
