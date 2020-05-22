# General
alias ls='ls -G'
alias v='vim'

# Kubernetes
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias lkc='loadkubeconfig'
alias ukc='unloadkubeconfig'
alias kgp='kubectl get pods'

# Terraform
alias yle_tf='/Library/Ruby/Gems/2.6.0/gems/yle_tf-1.2.0/bin/tf'
alias tffmt='terraform fmt -recursive'
alias tf='terraform'
alias tfw='terraform workspace'
alias tfws='terraform workspace select'

# Git
alias g='git'
alias gst='git status'
alias gc='git commit'
alias gapa='git add -p'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git push'
alias gb='git branch'

# Colour hack for vim and tmux
if [ -n $TMUX  ]; then
    alias vim="TERM=screen-256color vim"
fi
