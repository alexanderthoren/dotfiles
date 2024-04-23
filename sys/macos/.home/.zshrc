source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval $(thefuck --alias fuck)

source ~/.tmuxsessions

# run starship
eval "$(starship init zsh)"

# bun completions
[ -s "/Users/fever/.bun/_bun" ] && source "/Users/fever/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# vim mode in zsh
bindkey -v

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
alias n="~/.local/bin/lvim"
alias bupd="brew update"
alias bupg="brew upgrade"
alias grex="grex -c"
alias fuk='fuck'
alias fuky='fuck --yeah'
fappname () { mdls -name kMDItemCFBundleIdentifier -r /Applications/"$1".app; }
alias getnf="~/.local/bin/getnf"
alias lg="lazygit"

# git
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gapb="pbpaste | git apply"
alias gb="git branch"  
alias gba="git branch -a"
alias gbd="git branch -D"
alias gc="git commit"
alias gcempty="git commit --allow-empty -m \"Empty-Commit\""
alias gcb="git checkout -b $1"
alias gcc="git checkout"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gcf="git clean -f ."
alias gcl="git clone"
alias gd="git diff" 
alias gds="git diff $1 --stat"
alias gd-1="git diff head~1" 
alias gdrg="git diff head~1 | rg" 
alias gdt="git difftool -y"
alias gdpb="git diff | pbcopy"
alias gf="git fetch --all -p"
alias gl="git log" 
alias gm="git merge"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gmi="git merge -i"
alias gmt="git mergetool -y"
alias gps="git push"
alias gpso="git push -u origin \$(git branch --show-current)"
alias gpsd="git push -d origin"
alias gpl="git pull"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grc="git restore --staged .; git restore .; git clean -f"
alias gre="git restore"
alias grs="git restore --staged"
alias gs="git status"

# xcode
alias kx="killall Xcode"
alias repd="xcodebuild -resolvePackageDependencies"
alias rmdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias rmspm="rm -rf ~/Library/org.swift.swiftpm/"
alias rmcspm="rm -rf ~/Library/Caches/org.swift.swiftpm/"
alias xo="xed ."

# xcode server
alias xbsw="xcode-build-server config -workspace *.xcworkspace -scheme $1"
alias xbsp="xcode-build-server config -project *.xcodeproj -scheme $1"
xbbw () {
  rm -rf .bundle;
  xcodebuild -workspace *.xcworkspace -scheme "$1" -destination "generic/platform=iOS Simulator" -resultBundlePath .bundle build
}
xbbp () {
  rm -rf .bundle;
  xcodebuild build -alltargets -project $1.xcodeproj -destination "generic/platform=iOS Simulator" -resultBundlePath .bundle
}

# xcode build
xcblw () { xcodebuild -list -workspace $1.xcworkspace }
xcblp () { xcodebuild -list -project $1.xcodeproj }
xcbs () { xcodebuild build -workspace *.xcworkspace -scheme $1 -destination "platform=iOS Simulator,name=$2" -archivePath . }

# simulator
xcrb () { xcrun simctl boot $1; open -a Simulator }
alias xcri="xcrun simctl install booted $1"
alias xcro="xcrun simctl launch booted $1"
alias xcrou="xcrun simctl openurl booted $1"
alias xcrsa="xcrun simctl shutdown all"

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

