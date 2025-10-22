# zsh options
setopt extendedglob # Enable advanced pattern matching
setopt hist_expire_dups_first # Expire older duplicate history entries first
setopt hist_ignore_dups # Ignore duplicate history entries
setopt hist_ignore_space # Ignore commands starting with a space
setopt hist_verify # Show history command before executing
setopt inc_append_history # Append history lines as they are entered
setopt share_history # Share history between all sessions

export EDITOR=nvim
export VISUAL=$EDITOR

# Aliases
alias ls="${aliases[ls]:-ls} --color=auto"
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias la='ls -laO'
else
  alias la='ls -la'
fi
alias grep="${aliases[grep]:-grep} --color=auto"
alias dockerrm='docker rm -v $(docker ps -a -q)'
alias dockerrmi='docker rmi $(docker images -q)'
alias dockerrmid='docker rmi $(docker images -q -f "dangling=true")'

# Mise
eval "$($HOME/.local/bin/mise activate zsh)"

# Go
export GOPATH="$HOME/.go"

# fzf -- key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# Starship Prompt
eval "$(starship init zsh)"

# Only add homebrew completions if running macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(arch) == 'arm64' ]]; then
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
  else
    fpath=(/usr/local/share/zsh/site-functions $fpath)
  fi
fi

# Set zstyle options for completion caching BEFORE compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

zstyle ':completion:*' menu select $  # Enables a menu for multiple completions and automatically shows them
zstyle ':completion:*' list-prompt ''  # Removes the prompt
zstyle ':completion:*' list-lines 0  # Show all possibilities

# Initialize the completion system
autoload -Uz compinit
compinit

# zsh plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
