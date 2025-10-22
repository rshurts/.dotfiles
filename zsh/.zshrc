# zmodload zsh/zprof

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

# Only add homebrew completions if running macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(arch) == 'arm64' ]]; then
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
  else
    export HOMEBREW_PREFIX="/usr/local"
    fpath=(/usr/local/share/zsh/site-functions $fpath)
  fi
fi

# Set zstyle options for completion caching BEFORE compinit
zstyle ':completion:*' use-cache on # Use a cache
zstyle ':completion:*' cache-path ~/.cache/zsh # Set the cache location
zstyle ':completion:*' menu select $  # Enables a menu for multiple completions and automatically shows them
zstyle ':completion:*' list-prompt ''  # Removes the prompt
zstyle ':completion:*' list-lines 0  # Show all possibilities

# Use a compiled dump, slower on initial startup, but faster afterwards
ZCOMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
ZCOMPDUMP_ZWC="${ZCOMPDUMP}.zwc"

autoload -Uz compinit

# ensure compinit dump exists
if [[ ! -f $ZCOMPDUMP ]]; then
  compinit -d "$ZCOMPDUMP"
fi

# If .zcompdump is newer than the .zwc (or zwc missing), attempt to compile it.
# capture errors so startup won't break if compilation fails.
if [[ ! -f $ZCOMPDUMP_ZWC || $ZCOMPDUMP -nt $ZCOMPDUMP_ZWC ]]; then
  if ! zcompile "$ZCOMPDUMP" 2>/tmp/zcompile.err; then
    # compilation failed — remove bad zwc and keep going (fallback to text dump)
    rm -f "$ZCOMPDUMP_ZWC"
    # (optional) log failure for debugging:
    # echo "zcompile failed: $(< /tmp/zcompile.err)" >&2
    rm -f /tmp/zcompile.err
  fi
fi

# Finally load compinit using the dump — compinit will prefer the compiled .zwc if present.
# Use -C to skip certain expensive function checks (optional, but speeds startup)
compinit -d "$ZCOMPDUMP" -C

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

# zsh plugins
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zprof
