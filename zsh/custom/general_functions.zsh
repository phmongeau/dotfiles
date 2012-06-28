# todo.txt
function t() { 
  if [ $# -eq 0 ]; then
    todo.sh -d /path/to/your/todo.cfg ls
  else
    todo.sh -d /path/to/your/todo.cfg $* 
  fi
}
# fplay (Music)
#-----------------------------------------------------------------------------
MUSICROOT=~/Music
function fplay {
	if [ $1 = '-v' ]; then
		shift 1
		find -LE $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -print -exec open -a Vox "{}" \; &
	elif [ $1 = '-g' ]; then
		shift 1
		find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec open -a QuickTime\ Player "{}" \; -exec osascript -e 'tell application "QuickTime Player" to play document 1' \; &
	else
		find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec afplay "{}" \;
	fi
}
# play in vlc
#-----------------------------------------------------------------------------
function vlc()
{
    open "$*" -a VLC
}
# play in vox
#-----------------------------------------------------------------------------
function vox()
{
	fplay -v "$*"
}
# short wikipedia article
#-----------------------------------------------------------------------------
function wiki()
{
	dig +short txt $1.wp.dg.cx
}
# mkdir, cd into it
#-----------------------------------------------------------------------------
function mkcd () {
	mkdir -p "$*"
	cd "$*"
}

function goto() { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }

function cpf() { cp "$@" && goto "$_"; }
function mvf() { mv "$@" && goto "$_"; }


#play iTunes
function play () {
	echo 'tell application "iTunes" to play' | osascript
}
#pause iTunes
function pause () {
	echo 'tell application "iTunes" to pause' | osascript
}

#display in large type
function large () {
	# read $* TXT
	echo 'tell application "Quicksilver" to show large type "'$*'"' | osascript
}

# search for running processes:
# see: http://onethingwell.org/post/14669173541/any
function any() {
	emulate -L zsh
	unsetopt KSH_ARRAYS
	if [[ -z "$1" ]] ; then
		echo "any - grep for process(es) by keyword" >&2
		echo "Usage: any " >&2 ; return 1
	else
		ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}" | awk '{print $2,"-",$11}'
	fi
}

fp () { #find and list processes matching a string
	ps Ao pid,comm | awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () { #build a menu of processes to kill
	IFS=$'\n'
	PS3='Kill which process? (1 to cancel): '
	select OPT in "Cancel" $(fp $1); do
		if [ $OPT != "Cancel" ]; then
			kill $(echo $OPT|awk '{print $NF}')
		fi
		break
	done
	unset IFS
}

# Quick Look
ql () {
	qlmanage -p $*
}

# Paste to hastebin
haste() {
	curl -sd "$(cat $1)" http://hastebin.com/documents |
	sed -e 's/{"key":"/http:\/\/hastebin.com\//' -e "s/\"}/\.$(echo $1 |
	sed -e 's/.*\.//')\n/";
}

mdel() {
	python -c "print '\n'.join([str(i) for i in range($1, $2)])" | mpc del
}
