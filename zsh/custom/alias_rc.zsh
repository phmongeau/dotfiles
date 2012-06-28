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

alias badd='beet_strip_path.sh | mpc add'
alias madd='mpc add; mpc play'
alias msearch='mpc search any $*'
alias mpause='mpc idle; mpc pause'

alias workon='source env/bin/activate'
