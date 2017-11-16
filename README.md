# Erforderliche Symbolic Links für myconfigurations

	ln -s ~/myconfigurations/.zshrc ~/.zshrc
	ln -s ~/myconfigurations/.gitconfig ~/.gitconfig


# Zusatzliche verwendetet Symbolic Links

## Sublime Text 3
	ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl


# Anmerkungen

Mit dem folgenden Command kann ZSH als Standard-Shell festgelegt werden:
	chsh -s $(which zsh)
