# notes completion

NOTES=$(ls ~/Dropbox/Notes/ | sed -e 's/\ /\\ /g')

compctl -k "($NOTES)" n ncat
