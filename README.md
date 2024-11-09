# Dotfiles

1. `mkdir $HOME/.dotfiles`
2. `echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc`
3. `git clone --bare git@github.com:ralph-bergmann/dotfiles.git $HOME/.dotfiles`
4. `dotfiles checkout`
5. `dotfiles config --local status.showUntrackedFiles no`
6. `brew install nvim bat eza ripgrep zoxide fzf tmux starship lazygit difftastic rust-analyzer`
7. `brew install --cask alacritty`

If `fzf` completion isn't working run `$(brew --prefix)/opt/fzf/install`.

Install `tmux` `tpm`: `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`
In a `tmux` session press `<leader> I` to install all plugins.

Rename the original `rust-analyzer` so that the one needed for nvim can be taken from `brew`.

see [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

