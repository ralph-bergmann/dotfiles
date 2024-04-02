# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
export PATH=$ANDROID_PLATFORM_TOOLS:$FLUTTER_ROOT/bin:$CARGO_HOME/bin:~/.pub-cache/bin:/usr/local/sbin:$PATH

# turn Difftastic syntax highlighting off
export DFT_SYNTAX_HIGHLIGHT=off

# load fzf config(autocomplete, etc)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"

