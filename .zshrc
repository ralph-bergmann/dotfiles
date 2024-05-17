# You may need to manually set your language environment
export LANG=en_US.UTF-8


# If you're using macOS, you'll want this enabled
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Load completions
autoload -Uz compinit && compinit

# case insensitive path completio
# see https://superuser.com/a/1092328
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# Completion styling
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 100 16


# Keybindings
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward



# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


alias ls='eza -l -a -h'
alias tree='eza -l -a -h -T'
alias cat='bat'
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias back='cd $OLDPWD'
alias dotfiles='/usr/bin/git --git-dir=/Users/ralphbergmann/.dotfiles/ --work-tree=/Users/ralphbergmann'
# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
# alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32;49'
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"

export SDK_PATH=$HOME/development/sdks
export ANDROID_SDK_ROOT=$SDK_PATH/android-sdk
export ANDROID_PLATFORM_TOOLS=$ANDROID_SDK_ROOT/platform-tools
export FLUTTER_ROOT=$SDK_PATH/flutter
# export FLUTTER_ROOT=$SDK_PATH/flutter_master
# export DART_HOME=$FLUTTER_ROOT/bin/cache/dart-sdk
# export DART_HOME=$SDK_PATH/dart-sdk
export JAVA_HOME=`/usr/libexec/java_home`
export RUSTUP_HOME=$SDK_PATH/rustup
export CARGO_HOME=$SDK_PATH/cargo
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export PATH=$ANDROID_PLATFORM_TOOLS:$FLUTTER_ROOT/bin:$CARGO_HOME/bin:~/.pub-cache/bin:/usr/local/sbin:$PATH

# turn Difftastic syntax highlighting off
export DFT_SYNTAX_HIGHLIGHT=off


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

