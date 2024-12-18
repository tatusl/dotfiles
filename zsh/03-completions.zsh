autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# Load azure-cli completions and enable bash completions in zsh
if [ -f "/usr/local/etc/bash_completion.d/az" ]; then
  autoload -U +X bashcompinit && bashcompinit
  source /usr/local/etc/bash_completion.d/az
fi
