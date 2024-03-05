#
# ~/.bash_profile
#
# Note tmux doesn't open .bashrc instead it open .bash_profile
# Use .bashrc to conditionally open a tmux session when opening a new terminal
# Use .bash_profile to set the defaults

# Prompt
# The PROMPT_COMMAND executes after a command finishes it's execution, 
# Note: \[ and \] Make Shell to not account for characters under it.
# TODO: Color Encoding, Probable Git Status Inclusion, Time Display
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
PROMPT_COMMAND=_prompt
function _prompt(){
	# Capture STATUS command before any command gets to execute
	STATUS="$?";PID="$!";RET=$STATUS
	if [[ ! $STATUS -eq 0 ]] ; then
		STATUS="[$STATUS]"
	else 
		STATUS=""
	fi

	# Colors
	local col_brace=$( tput sgr0; tput setaf 243 )
	local col_user=$( tput setaf 69; tput bold )
	local col_rst=$( tput sgr0; tput setaf 249 )
	local col_time=$( tput bold )
	local col_prompt=$( tput bold; tput setaf 124 )
	# Time 
	date="$( date +'%I:%M' )"
	
	if [[ $date =~ $regex ]] ; then
		date="\[${col_brace}\][\[${col_time}\]$date\[${col_brace}\]]\[${col_rst}\]"
	fi

	# Current Directory
	DIR=`pwd | awk --field-separator '/' '{print $NF}'` 
#	if [[ DIR -eq '' ]] ; then
#		DIR='/'
#	fi
	local user="\[${col_user}\]${USER}\[${col_rst}\]"
	PS1="$date ${user} \[${col_prompt}\]${STATUS}▶ \[${col_rst}\]"
}
