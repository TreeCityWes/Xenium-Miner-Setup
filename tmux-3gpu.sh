#!/bin/bash 

# Create a new tmux session, but don't attach to it yet 
tmux new-session -d -s gpuminer 

# Split the window vertically, creating top and bottom panes 
tmux split-window -v 

# Select the top pane and split it horizontally, creating two top panes 
tmux select-pane -t 0 
tmux split-window -h 

# Select the bottom pane and split it horizontally, creating two bottom panes 
tmux select-pane -t 2 
tmux split-window -h 

# Run the Python miner command in the top-left pane (pane 0) 
tmux send-keys -t gpuminer:0.0 'python3 miner.py --gpu=true' C-m 

# Run the GPU miner command in the top-right pane (pane 1) and assign it to GPU 0 
tmux send-keys -t gpuminer:0.1 './xengpuminer -d 0' C-m 

# Run the GPU miner command in the bottom-left pane (pane 2) and assign it to GPU 1 
tmux send-keys -t gpuminer:0.2 './xengpuminer -d 1' C-m 

# Run the GPU miner command in the bottom-right pane (pane 3) and assign it to GPU 2 
tmux send-keys -t gpuminer:0.3 './xengpuminer -d 2' C-m 

# Finally, attach to the tmux session 
tmux attach -t gpuminer 
