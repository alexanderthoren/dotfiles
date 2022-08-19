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

# git
# simple
alias ga="git add ."
alias gb="git branch"
alias gc="git commit"
alias gcf="git clean -f"
alias gd="git diff"
alias gf="git fetch"
alias gp="git push"
alias gr="git restore $1"
alias grc="git restore --staged .; git restore .; git clean -f"
alias grs="git restore --staged $1"
alias gs="git status"

# compose
function gap() {
	ga
	gc
	gp
}
