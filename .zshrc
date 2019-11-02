CONFIG_PATH="$HOME/.dotfiles"

for file in "$CONFIG_PATH"/zsh/* "$CONFIG_PATH"/zsh/secret/*; do
    source "$file"
done
