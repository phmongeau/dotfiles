# notes completion

#NOTES=$(ls ~/Dropbox/Notes/ | sed -e 's/\ /\\ /g')
COMMANDS="check export help start"

compctl -k "($COMMANDS)" foreman
