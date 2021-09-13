set -o vi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedcbcgcded
alias sd='ssh dev-dsk-agklein-2a-c985466e.us-west-2.amazon.com'
alias gits='git status'
alias bb='brazil-build'
alias gca='git commit --amend'
alias gcp='git cherry-pick'
alias lsg='ls | grep'
alias harpa='/usr/local/Cellar/node/13.3.0/lib/node_modules/harp/bin/harp'
alias gok='cd ~/wks/kdp/src'
alias debug_tunnel='ssh -N -L 9000:127.0.0.1:9000 agklein.aka.corp.amazon.com'
alias scpKey='scp -r ~/.midway agklein.aka.corp.amazon.com:/home/agklein'
export PATH="/apollo/env/SDETools/bin:$PATH"
export PATH="$HOME/.toolbox/bin:$PATH"
