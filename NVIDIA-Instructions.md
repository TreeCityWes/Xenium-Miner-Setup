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

> **Disclaimer:** Before executing any commands, ensure you have researched and understood what each command does. This setup is intended for Ubuntu systems only. If you are using a rented cloud GPU, make sure that the provider's terms of service allow for cryptocurrency mining.

```bash
# Update package lists and upgrade installed packages
sudo apt update && apt upgrade -y

# Install git, cmake, make, and sudo packages
sudo apt install git cmake make sudo -y

# Clone XenGPU Miner repository from GitHub
sudo git clone https://github.com/shanhaicoder/XENGPUMiner.git

# Change to the cloned XENGPUMiner directory
cd XENGPUMiner

# Install pip for Python 3
sudo apt-get install python3-pip

# Update package lists and upgrade installed packages
sudo apt update && apt upgrade -y

# Install git, cmake, make, and sudo packages
sudo apt install git cmake make sudo -y

# Clone XenGPU Miner repository from GitHub
sudo git clone https://github.com/shanhaicoder/XENGPUMiner.git

# Change to the cloned XENGPUMiner directory
cd XENGPUMiner

# Install pip for Python 3
sudo apt-get install python3-pip

# Install required Python packages from requirements.txt
sudo pip install -U -r requirements.txt

# Install nano text editor
sudo apt install nano

# Install NVIDIA CUDA toolkit
sudo apt install nvidia-cuda-toolkit

# Install OpenCL development files
sudo apt install ocl-icd-opencl-dev

# Open config.conf file in nano for editing
sudo nano config.conf

# Make the build.sh script executable
sudo chmod +x build.sh

# Run build.sh script with specified CUDA architecture flag. This creates the miner executable, xengpuminer. 
./build.sh -cuda_arch sm_86

The xengpuminer and the miner.py script are now ready to execute. Both should be run concurrently.
There are several methods to running such as individual sessions or using Screen to toggle screens.
My favorite is the TMUX script below. 

(Optional - Create TMUX Script)
# Install tmux terminal multiplexer
sudo apt install tmux

# Open tmux.sh file in nano for editing
sudo nano tmux.sh

# Make tmux.sh script executable
sudo chmod +x tmux.sh

# Execute tmux.sh script
./tmux.sh

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


#TMUX Script (single miner)


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

2x GPU
![image](https://github.com/TreeCityWes/Xenium-Miner-Setup/assets/93751858/b24d06df-fd05-416f-a31d-4bdcb1eee30d)

