#!/bin/bash 

# Create a new tmux session, but don't attach to it yet 
tmux new-session -d -s gpuminer 

# Split the window vertically into two panes 
tmux split-window -v 

# Run the Python miner command in the top pane (pane 0) 
tmux send-keys -t gpuminer:0.0 'python3 miner.py --gpu=true' C-m 

# Wait for 3 seconds 
sleep 3 

# Run the GPU miner command in the middle pane (pane 1) and assign it to GPU 0 
tmux send-keys -t gpuminer:0.1 './xengpuminer -d 0' C-m 

# Split the window horizontally in the bottom pane to create a new pane (pane 2) 
tmux split-window -h -t gpuminer:0.1 

# Run the GPU miner command in the bottom pane (pane 2) and assign it to GPU 1 
tmux send-keys -t gpuminer:0.2 './xengpuminer -d 1' C-m 

# Finally, attach to the tmux session 
tmux attach -t gpuminer 
