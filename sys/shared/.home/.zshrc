#!/bin/sh
# shellcheck disable=SC2035,SC3028,SC3010,SC3046,SC1091,SC1090

autoload -Uz compinit
compinit

ostype=$OSTYPE
if [[ $ostype == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  feh --no-fehbg --bg-fill ~/Pictures/desktop_background.jpg
fi

if [[ $ostype == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # Added by OrbStack: command-line tools and integration
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

source "$(brew --prefix)"/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# shellcheck disable=SC2034
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d3869b"

# run tmux
source ~/.tmuxsessions

# run starship
eval "$(starship init zsh)"

# vim mode in zsh
bindkey -v

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(rbenv init - zsh)"

# bun completions
[ -s "/Users/fever/.bun/_bun" ] && source "/Users/fever/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# sourcekit-lsp
export SOURCEKIT_PATH=/usr/bin/sourcekit-lsp
export PATH="$SOURCEKIT_PATH:$PATH"

# aliases
# system
alias cd="z"
alias ..="cd .."
alias ls="eza --oneline --icons=always --group-directories-first"
alias lsd="du -h -d 1"
alias ll="ls -la"
alias szsh="source ~/.zshrc"
alias f.files="source ~/Developer/dotfiles/run.sh f"
alias u.files="source ~/Developer/dotfiles/run.sh u"
alias f="fzf"
alias fe="fzf -e"
alias n="nvim"
alias grex="grex -c"
alias lg="lazygit"

# github cli
alias ghc="gh copilot"
alias ghce="gh copilot explain"
alias ghcs="gh copilot suggest"

# git
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gapb="pbpaste | git apply"
alias gb="git branch"  
alias gba="git branch -a"
alias gbd="git branch -D"
alias gbu="git branch -u origin/\$(git branch --show-current)"
alias gc="git commit"
alias gcempty="git commit --allow-empty -m \"Empty-Commit\""
gcb () { git checkout -b "$1" ; }
alias gcc="git checkout"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gcf="git clean -f ."
alias gcl="git clone"
alias gd="git diff" 
gds () { git diff "$1" --stat ; }
alias gd-1="git diff head~1" 
alias gdrg="git diff head~1 | rg" 
alias gdt="git difftool -y"
alias gdpb="git diff | pbcopy"
gdpbc () { git diff "$1" | pbcopy ; }
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
xbsw () { xcode-build-server config -workspace *.xcworkspace -scheme "$1" ; }
xbsp () { xcode-build-server config -project *.xcodeproj -scheme "$1" ; }
xbbw () {
  rm -rf .bundle;
  rm -rf .bundle.xcresult;
  xcodebuild -workspace *.xcworkspace -scheme "$1" -destination "generic/platform=iOS Simulator" -resultBundlePath .bundle build | xcbeautify ;
}
xbbp () {
  rm -rf .bundle;
  xcodebuild build -alltargets -project "$1".xcodeproj -destination "generic/platform=iOS Simulator" -resultBundlePath .bundle | xcbeautify ;
}

# xcode build
xcblw () { xcodebuild -list -workspace "$1".xcworkspace | xcbeautify ; }
xcblp () { xcodebuild -list -project "$1".xcodeproj | xcbeautify ; }
xcbs () { xcodebuild build -workspace *.xcworkspace -scheme "$1" -destination "platform=iOS Simulator,name=$2" -derivedDataPath ./ -archivePath ./ | xcbeautify ; }
xcbst () { xcodebuild test -workspace *.xcworkspace -scheme "$1" -destination "platform=iOS Simulator,name=$2" -derivedDataPath ./ | xcbeautify ; }

# simulator
xcrb () { xcrun simctl boot "$1"; open -a Simulator ; }
xcri () { xcrun simctl install booted "$1" ; }
xcro () { xcrun simctl launch booted "$1" ; }
xcrou () { xcrun simctl openurl booted "$1" ; } 
alias xcrsa="xcrun simctl shutdown all"

# swift
alias sb="swift build"
alias sr="swift run"

# swift tools
alias souw="sourcery --config .sourcery.yaml --watch"
alias psc="periphery scan"
alias pscs="periphery scan --setup"

# python
alias python="python3"
alias pip="pip3"

# docker
alias dcb="docker compose build"
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcd="docker compose down"
alias dcs="docker compose stop"

# httpie
alias http="http --pretty all"
alias https="https --pretty all"
httpb() { http --pretty all "$1" | bat ; }
httppb() { http --pretty all "$1" | pbcopy ; }
httpsb() { https --pretty all "$1" | bat ; }
httpspb() { https --pretty all "$1" | pbcopy ; }

# bartib
alias bb="bartib -f ~/.dailylog"
alias bbe="bartib -f ~/.dailylog edit -e nvim"
alias bbcu="bartib -f ~/.dailylog current"
alias bbla="bartib -f ~/.dailylog last"
alias bbli="bartib -f ~/.dailylog list"
alias bblit="bartib -f ~/.dailylog list --today"
alias bbliy="bartib -f ~/.dailylog list --yesterday"
alias bbliwc="bartib -f ~/.dailylog list --current_week"
alias bbliwl="bartib -f ~/.dailylog list --last_week"
bbstart() { bartib -f ~/.dailylog start -p $1 -d $2 ; }
bbco() { bartib -f ~/.dailylog "continue" $1 ; }
alias bbstop="bartib -f ~/.dailylog stop"
alias bbr="bartib -f ~/.dailylog report"
alias bbrt="bartib -f ~/.dailylog report --today"
alias bbry="bartib -f ~/.dailylog report --yesterday"
alias bbrwc="bartib -f ~/.dailylog report --current_week"
alias bbrwl="bartib -f ~/.dailylog report --last_week"
alias bbp="bartib -f ~/.dailylog projects"

# cursor
alias c="cursor"
alias ca="cursor-agent"

export DEBUGPY_ROOT="$HOME/.virtualenvs/debugpy"
export PATH="$DEBUGPY_ROOT/bin:$PATH"

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

export PYTHONPATH="${PYTHONPATH}:./src"
export PATH="$HOME/.local/bin:$PATH"
source ~/.invoke-completion.sh
