#!/bin/zsh

# ZSH config files by Philippe Mongeau

#-----------------------------------------------------------------------------
#   Zsh opts
#-----------------------------------------------------------------------------
autoload -U compinit
compinit

autoload -U promptinit
promptinit

setopt autolist
setopt nolistbeep
setopt menucomplete
setopt completealiases

zstyle ':completion:*' verbose yes
zstyle ':completion:*:description' format '%B%d%b'
zstyle ':completion:*:message' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

# vi mode
set -o vi

# --- edit line in editor ---
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey -M vicmd v edit-command-line


# Par
PARINIT=rTbgqR\ B=.,\?_A_a\ Q=_s\>\|

#-----------------------------------------------------------------------------
#   Source
#-----------------------------------------------------------------------------

# GIT PROMPT
. ~/.zsh/git_prompt_rc

# ENV VARS
. ~/.zsh/env_vars_rc

# PATH
. ~/.zsh/path_rc

# ALIASES
. ~/.zsh/alias_rc

# NOTES
. ~/.zsh/notes

# FUNCTIONS
. ~/.zsh/general_functions

# COMPLETIONS
. ~/.zsh/completions

# Z
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

#-----------------------------------------------------------------------------
#   Plugins
#-----------------------------------------------------------------------------

# Syntax hiligth
. ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# HISTORY SEARCH
. ~/.zsh/plugins/zsh-history-substring-search.zsh

#-----------------------------------------------------------------------------
#   Other
#-----------------------------------------------------------------------------
