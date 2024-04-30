eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
