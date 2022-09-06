# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix powerlevel10k)/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ALIAS

# system
alias ll="ls -la"
alias lss="du -hs * | sort -h"

# git
alias ga="git add ."
alias gap="ga; gc; gps"
alias gb="git branch"
alias gbd="git branch -d"
alias gc="git commit"
alias gcb="git checkout -b"
alias gcc="git checkout"
alias gcf="git clean -f"
alias gd="git diff"
alias gf="git fetch"
alias gps="git push"
alias gpl="git pull"
alias gr="git restore"
alias grc="git restore --staged .; git restore .; git clean -f"
alias grs="git restore --staged"
alias gs="git status"
alias gu="gf; gpl"

# Enable vi mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
