# -----------------------------------------------------------------------------
#	ALIASES
# -----------------------------------------------------------------------------

alias l='ls -GghF'
alias la='ls -GgahF'
alias lg='ls -GgahF | grep $*'

alias vless='/usr/share/vim/vim72/macros/less.sh'

alias mvim='mvim --remote-silent'
alias gvim='mvim --remote-silent'

alias rmpyc='rm *.pyc'

# todo.txt
function t() { 
  if [ $# -eq 0 ]; then
    todo.sh -d /path/to/your/todo.cfg ls
  else
    todo.sh -d /path/to/your/todo.cfg $* 
  fi
}

