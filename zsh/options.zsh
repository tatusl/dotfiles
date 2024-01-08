export SHELL=$(which zsh)
export GPG_TTY=$(tty)
export EDITOR='nvim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin

# History setting
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Appends every command to the history file once it is executed
setopt inc_append_history

# Do not show duplicates
setopt HIST_FIND_NO_DUPS

# Do not store space prefixed commands to history
setopt histignorespace

# Timeout between normal and insert vi modes (in tenth-of-seconds)
export KEYTIMEOUT=1

# Change directories without typing "cd"
setopt autocd

# Extended glob syntax
setopt extended_glob

# Autocomplete special-dirs ("." and "..")
zstyle ':completion:*' special-dirs true
