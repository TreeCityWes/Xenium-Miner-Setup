# XenBlocks GPU Mining Setup Guide

This tutorial guides you through the process of setting up XenBlocks GPU mining using a cloud GPU miner on Ubuntu. Before diving into the script, ensure you have a basic understanding of user permissions and the `sudo` command in Linux. 

- **User Context:** 
    - Operations like installing, updating, or removing software require administrative privileges in Linux. By default, normal users don't have these privileges to ensure system security and integrity.
- **Understanding `sudo`:**
    - `sudo` stands for "superuser do," allowing a user to run commands with administrative privileges temporarily. When you prepend a command with `sudo`, you're telling the system to execute that command as the superuser (or an administrative user).
- **Permissions:**
    - Permissions dictate who can read, write, or execute files and directories. Make sure you are executing commands as a user that has permission. Scripts also need to be made executable to run them. For example, `sudo chmod +x build.sh` allows the `build.sh` script to be executable.
- **Utilizing `sudo -s`:**
    - If you plan to run multiple commands as the superuser, typing `sudo` for every command can be tedious. Instead, you can switch to the superuser mode by typing `sudo -s`. This command opens a new shell session where you're logged in as the superuser, allowing you to run subsequent commands with superuser privileges without prefixing them with `sudo`.

## Commands to Configure XenBlocks GPU mining
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

# Run build.sh script with specified CUDA architecture flag
./build.sh -cuda_arch sm_86

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
