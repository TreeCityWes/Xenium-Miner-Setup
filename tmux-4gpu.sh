#!/bin/bash 

 

# Create a new tmux session, but don't attach to it yet 

tmux new-session -d -s gpuminer 

 

# Split the window horizontally, creating the first two panes 

tmux split-window -v 

 

# Create additional horizontal panes 

tmux select-pane -t 0 

tmux split-window -v 

tmux select-pane -t 0 

tmux split-window -v 

tmux select-pane -t 0 

tmux split-window -v  # Additional split for the fourth GPU miner 

 

# At this point, you should have five horizontal panes. 

 

# Run the Python miner command in the first pane (pane 0) 

tmux send-keys -t 0 'python3 miner.py --gpu=true' C-m 

 

# Run the GPU miner commands in the remaining panes and assign them to GPUs 

tmux send-keys -t 1 './xengpuminer -d 0' C-m 

tmux send-keys -t 2 './xengpuminer -d 1' C-m 

tmux send-keys -t 3 './xengpuminer -d 2' C-m 

tmux send-keys -t 4 './xengpuminer -d 3' C-m  # Command for the fourth GPU miner 

 

# Equalize the size of all panes 

tmux select-layout even-vertical 

 

# Finally, attach to the tmux session 

tmux attach -t gpuminer 