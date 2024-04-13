source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval $(thefuck --alias fuck)

source ~/.tmuxsessions

# run starship
eval "$(starship init zsh)"

# aliases
# system
alias cd="z"
alias ..="cd .."
alias ls="eza --oneline --icons=always --group-directories-first"
alias lss="eza --oneline --icons=always --reverse --sort=size"
alias lsg="eza --oneline --icons=always --long --header --inode --git"
alias szsh="source ~/.zshrc"
alias ll="ls -la"
alias f="fzf"
alias fe="fzf -e"
alias n="nvim"
alias bupd="brew update"
alias bupg="brew upgrade"
alias grex="grex -c"
alias fuk='fuck'
alias fuky='fuck --yeah'

# git
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gapb="pbpaste | git apply"
alias gb="git branch | bat"  
alias gba="git branch -a"
alias gbd="git branch -D"
alias gc="git commit"
alias gcb="git checkout -b $1"
alias gcc="git checkout"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gcf="git clean -f ."
alias gcl="git clone"
alias gd="git diff | bat" 
alias gds="git diff $1 --stat | bat"
alias gd-1="git diff head~1 | bat" 
alias gdrg="git diff head~1 | rg | bat" 
alias gdt="git difftool -y"
alias gdpb="git diff | pbcopy"
alias gf="git fetch --all -p"
alias gl="git log | bat" 
alias gm="git merge"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gmi="git merge -i"
alias gmt="git mergetool -y"
alias gps="git push"
alias gpso="git push -u origin $(git branch --show-current)"
alias gpsd="git push -d origin"
alias gpl="git pull"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grc="git restore --staged .; git restore .; git clean -f"
alias gre="git restore"
alias grs="git restore --staged"
alias gs="git status | bat"

# xcode
alias kx="killall Xcode"
alias repd="xcodebuild -resolvePackageDependencies"
alias rmdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias rmspm="rm -rf ~/Library/org.swift.swiftpm/"
alias rmcspm="rm -rf ~/Library/Caches/org.swift.swiftpm/"
alias xo="xed ."

# swift
alias souw="sourcery --config .sourcery.yaml --watch"
alias psc="periphery scan"
alias pscs="periphery scan --setup"

# python
alias python="python3"
alias pip="pip3"

# docker
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcd="docker compose down"
alias dcs="docker compose stop"
