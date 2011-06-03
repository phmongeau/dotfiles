#!/bin/bash
# Bash config files by Philippe Mongeau

# A nice intro :)
#fortune -s |cowsay
fortune humorists |cowsay -f small
#-----------------------------------------------------------------------------
#   Env Vars
#-----------------------------------------------------------------------------
export EDITOR=mvim
export NODE_PATH="/usr/local/lib/node"
#EDITOR=nano

# for fcshctl
export FLEX_HOME="/usr/local/flex_sdk_4.1"

export TESSDATA_PREFIX="/usr/local/Cellar/tesseract/2.04/share/"

# show git branch name when in a git repo
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\w\$(parse_git_branch) $ "

# -----------------------------------------------------------------------------
#	PATH
# -----------------------------------------------------------------------------

#flex
PATH=$PATH:/usr/local/flex_sdk_4.1/bin
#PATH=$PATH:/usr/local/bin:/usr/local/flex_sdk_3.4/bin

#infrom lib
PATH=$PATH:/usr/local/inform

PATH=$PATH:/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin

#wireshark
PATH="$HOME/bin/wireshark:$PATH"

# add sbin to the path
PATH="/usr/local/sbin:$PATH"

#HAXE Path
export HAXE_LIBRARY_PATH="`brew --prefix`/share/haxe/std"

# HAXE libs
PATH="/usr/lib/haxe/lib:$PATH"
DYLD_LIBRARY_PATH="/usr/lib/haxe/lib/nme/2,0,2/ndll/iPhone"

#Haskell Bins
PATH="/Users/philippemongeau/.cabal/bin/:$PATH"

# add /usr/local/bin
PATH="/usr/local/bin:$PATH"

# ~/bin for user specific commands:
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

export PATH

# -----------------------------------------------------------------------------
#	ALIASES
# -----------------------------------------------------------------------------

alias l='ls -GgF'
alias la='ls -GgaF'
alias lg='ls -GgaF | grep $*'

alias vless='/usr/share/vim/vim72/macros/less.sh'

alias mvim='mvim --remote-silent'
alias gvim='mvim --remote-silent'

#alias t='todo.sh'
function t() { 
  if [ $# -eq 0 ]; then
    todo.sh -d /path/to/your/todo.cfg ls
  else
    todo.sh -d /path/to/your/todo.cfg $* 
  fi
}

#-----------------------------------------------------------------------------
#   Notes
#-----------------------------------------------------------------------------

n()
{
	if [[ $* == *.* ]] ; then
		#$f=$(echo $* | sed -e 's/_/ /g' 2>/dev/null)
		$EDITOR ~/Dropbox/Notes/"$(echo $* | sed -e 's/_/ /g')"
	else
		$EDITOR ~/Dropbox/Notes/"$*".md
	fi
}

ncat()
{
    cat ~/Dropbox/Notes/"$*"*
	echo "\n"
}

nls()
{
    ls -c ~/Dropbox/Notes/ | grep -i "$*"
}

#----------------
#   Par
#----------------

PARINIT=rTbgqR\ B=.,\?_A_a\ Q=_s\>\|


#-----------------------------------------------------------------------------
#   fplay (Music)
#-----------------------------------------------------------------------------
MUSICROOT=~/Music
function fplay {
if [ $1 = '-v' ]; then
shift 1
find -LE $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -print -exec afplay "{}" \; &
elif [ $1 = '-g' ]; then
shift 1
find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec open -a QuickTime\ Player "{}" \; -exec osascript -e 'tell application "QuickTime Player" to play document 1' \; &

else
find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec afplay "{}" \; &
fi
}
#-----------------------------------------------------------------------------
function vlc()
{
    open "$*" -a VLC
}
#-----------------------------------------------------------------------------
function wiki()
{
	dig +short txt $1.wp.dg.cx
}
#-----------------------------------------------------------------------------
# mkdir, cd into it
mkcd () {
mkdir -p "$*"
cd "$*"
}

#-----------------------------------------------------------------------------
#   Source
#-----------------------------------------------------------------------------
. ~/.bash_completion

