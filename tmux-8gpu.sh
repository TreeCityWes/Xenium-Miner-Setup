#!/bin/bash 

# Create a new tmux session, but don't attach to it yet 
tmux new-session -d -s gpuminer 

# First window with the Python miner 
tmux rename-window 'Python Miner' 
tmux send-keys 'python3 miner.py --gpu=true' C-m 

# Create a second window with four panes for GPUs 0-3 
tmux new-window -t gpuminer -n 'GPUs 0-3' 
for i in {1..3}; do 
    tmux split-window -v 
    tmux select-layout even-vertical 
done 

# Run the GPU miner commands in the second window's panes 
for i in {0..3}; do 
    tmux send-keys -t gpuminer:1.$i "./xengpuminer -d $i" C-m 
done 

# Create a third window with four panes for GPUs 4-7 
tmux new-window -t gpuminer -n 'GPUs 4-7' 
for i in {1..3}; do 
    tmux split-window -v 
    tmux select-layout even-vertical 
done 

# Run the GPU miner commands in the third window's panes 
for i in {0..3}; do 
    tmux send-keys -t gpuminer:2.$i "./xengpuminer -d $((i+4))" C-m 
done 

# Finally, attach to the tmux session 
tmux attach-session -t gpuminer 
