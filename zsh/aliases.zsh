# General
alias ls='ls -G'
alias v='vim'

# Use nvim
alias nvim='vim'

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
alias gd='git diff'

# Interactive fuzzy-searching git branch selector with fzf
alias gcof='git for-each-ref refs/heads/ --sort=-committerdate --format=\''%\(refname:short\)\'' | fzf | xargs git checkout'

# Interactive YubiKey TOTP token selector
alias ykmfa='ykman oath accounts code -s $(ykman oath list | fzf) | tr -cd "[:alnum:]" |pbcopy'

# Colour hack for vim and tmux
if [ -n $TMUX  ]; then
    alias vim="TERM=screen-256color nvim"
fi

alias awsp='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ${AWS_CONFIG_FILE} | fzf)'
alias avefzf='aws-vault exec $(sed -n "s/\[profile \(.*\)\]/\1/gp" ${AWS_CONFIG_FILE} | fzf)'

# Clear clipboard
alias pbclear='pbcopy < /dev/null'
