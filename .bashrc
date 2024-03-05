# Note this File used to manage terminal emulator not tmux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Startup tmux
if [[ -z ${TMUX} ]] ; then
	! tmux attach-session && tmux new-session -s 'home' \; send-keys 'clear; neofetch' C-m 
	exit
fi


