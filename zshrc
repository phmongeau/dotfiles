# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="phmongeau"

plugins=(osx git python brew pip history-substring-search)

source $ZSH/oh-my-zsh.sh


#-----------------------------------
fpath=(~/.zsh/zsh-completions $fpath)
fpath=(~/.zsh/custom/completions $fpath)

source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

autoload zmv

. `brew --prefix`/etc/profile.d/z.sh
