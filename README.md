# Dotfiles

1. `mkdir $HOME/.dotfiles`
2. `echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc`
3. `git clone --bare git@github.com:ralph-bergmann/dotfiles.git $HOME/.dotfiles`
4. `dotfiles checkout`
5. `dotfiles config --local status.showUntrackedFiles no`
6. `brew install nvim bat eza ripgrep`
7. `brew install --cask alacritty`
8. [install `ohmyzsh`](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation)
9. [install `powerlevel10k`](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)

see [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)