export SHELL=$(which zsh)
export GPG_TTY=$(tty)
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin

# History setting
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Timeout between normal and insert vi modes (in tenth-of-seconds)
export KEYTIMEOUT=1

# Change directories without typing "cd"
setopt AUTOCD

# Autocomplete special-dirs ("." and "..")
zstyle ':completion:*' special-dirs true
