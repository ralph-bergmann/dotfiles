# Config Files

1. `mkdir ~/.dotfiles`
2. `echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc`
3. `git clone --bare git@github.com:ralph-bergmann/dotfiles.git .dotfiles`
4. `config checkout`
5. `config config --local status.showUntrackedFiles no`
6. `brew install nvim bat eza`
7. `brew install --cask alacritty`

see [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)
