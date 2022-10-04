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
alias s="source"
alias si="source install.sh"
alias f="fzf"
alias fe="fzf -e"
alias n="nvim"
alias ll="ls -la"
alias lss="du -hs * | sort -hr"

# Xcode
alias repd="xcodebuild -resolvePackageDependencies"
alias rmdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias rmspm="rm -rf ~/Library/Caches/org.swift.swiftpm/; rm -rf ~/Library/org.swift.swiftpm/"
alias respm="rmspm; repd"
alias rsxcode="killall Xcode; rmdd; respm; xed ."

# brew
alias biq="brew install -q"
alias buu="brew update -q; brew upgrade -q"
alias bt="brew tap -q"

# git
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gap="git add .; git commit; git push"
alias gb="git branch"
alias gbd="git branch -d"
alias gc="git commit"
alias gcb="git checkout -b"
alias gcc="git checkout"
alias gcf="git clean -f"
alias gcl="git clone"
alias gd="git diff"
alias gd-1="git diff head~1"
alias gdrg="git diff head~1 | rg"
alias gdt="git difftool -y"
alias gf="git fetch"
alias gl="git log"
alias gmt="git mergetool -y"
alias gps="git push"
alias gpl="git pull"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grc="git restore --staged .; git restore .; git clean -f"
alias gre="git restore"
alias grs="git restore --staged"
alias gs="git status"
alias gu="git fetch; git pull"

# Enable vi mode
bindkey -v

# To customize FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
