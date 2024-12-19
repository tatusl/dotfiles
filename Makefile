all: install

install:
	mkdir -p ~/.config/

	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship/starship.toml ~/.config/starship.toml
	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/zshrc ~/.zshrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux/tmux.conf ~/.tmux.conf
	[ -f ~/.tmuxline.conf ] || ln -s $(PWD)/tmux/tmuxline.conf ~/.tmuxline.conf
	[ -d ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim
	[ -d ~/.config/kitty ] || ln -s $(PWD)/kitty ~/.config/kitty

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.config/starship.toml
	rm -f ~/.zshrc
	rm -f ~/.tmux.conf
	rm -f ~/.tmuxline.conf
	rm -f ~/.config/nvim
	rm -f ~/.config/kitty
