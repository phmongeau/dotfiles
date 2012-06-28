#-----------------------------------------------------------------------------
#   Notes
#-----------------------------------------------------------------------------

function n()
{
	if [[ $* == *.* ]] ; then
		$EDITOR ~/Dropbox/Notes/"$(echo $* | sed -e 's/_/ /g')"
	else
		$EDITOR ~/Dropbox/Notes/"$*".md
	fi
}

function ncat()
{
    cat ~/Dropbox/Notes/"$*"*
	echo "\n"
}

function nls()
{
	if [ $# -eq 0 ]
	then
		ls -c ~/Dropbox/Notes
	else 
		ls -c ~/Dropbox/Notes/ | grep -i "$*"
	fi

}
