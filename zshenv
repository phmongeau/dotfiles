#flex
PATH="$PATH:/usr/local/flex_sdk_4.1/bin"
#PATH=$PATH:/usr/local/bin:/usr/local/flex_sdk_3.4/bin

#infrom lib
PATH="$PATH:/usr/local/inform"

#PostgreSQL
PATH="/Library/PostgreSQL/8.3/bin:$PATH"

PATH="$PATH:/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin"

# add sbin to the path
PATH="/usr/local/sbin:$PATH"


# HAXE libs
PATH="/usr/lib/haxe/lib:$PATH"

#Haskell Bins
PATH="/Users/philippemongeau/.cabal/bin:$PATH"

# add /usr/local/bin
PATH="/usr/local/bin:$PATH"

#Python
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"

# ~/bin for user specific commands:
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

export PATH
