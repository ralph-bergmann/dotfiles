# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

alias ls='eza -l -a -h'
alias tree='eza -l -a -h -T'
alias cat='bat'
alias back='cd $OLDPWD'
alias dotfiles='/usr/bin/git --git-dir=/Users/ralphbergmann/.dotfiles/ --work-tree=/Users/ralphbergmann'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32;49'

export SDK_PATH=$HOME/development/sdks
export ANDROID_SDK_ROOT=$SDK_PATH/android-sdk
export ANDROID_PLATFORM_TOOLS=$ANDROID_SDK_ROOT/platform-tools
export FLUTTER_ROOT=$SDK_PATH/flutter
# export FLUTTER_ROOT=$SDK_PATH/flutter_master
# export DART_HOME=$FLUTTER_ROOT/bin/cache/dart-sdk
# export DART_HOME=$SDK_PATH/dart-sdk
# export JAVA_HOME=`/usr/libexec/java_home`
export RUSTUP_HOME=$SDK_PATH/rustup
export CARGO_HOME=$SDK_PATH/cargo
export PATH=$ANDROID_PLATFORM_TOOLS:$FLUTTER_ROOT/bin:$CARGO_HOME/bin:~/.pub-cache/bin:/usr/local/sbin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# load fzf config(autocomplete, etc)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh --cmd cd)"

