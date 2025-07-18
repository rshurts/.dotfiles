# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Completions
#
# Prezto has its own compile dump, if new completions aren't showing up:
# `rm -rf .zcompdump`
# `rm -rf .cache/prezto/zcompdump.zwc` to remove the compiled dump
# `autoload -Uz compinit && compinit`
# `mv .zcompdump .cache/prezto/zcompdump`
# restart terminal
#
# Only add homebrew completions if running macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(arch) == 'arm64' ]]; then
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
  else
    fpath=(/usr/local/share/zsh/site-functions $fpath)
  fi
fi

# Aliases
alias dockerrm='docker rm -v $(docker ps -a -q)'
alias dockerrmi='docker rmi $(docker images -q)'
alias dockerrmid='docker rmi $(docker images -q -f "dangling=true")'
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias la='ls -laO'
else
  alias la='ls -la'
fi

# Mise
eval "$($HOME/.local/bin/mise activate zsh)"

# Go
export GOPATH="$HOME/Developer/Go"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
