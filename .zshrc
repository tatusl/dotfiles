CONFIG_PATH="$HOME/.dotfiles"

for file in "$CONFIG_PATH"/zsh/*; do
    source "$file"
done
