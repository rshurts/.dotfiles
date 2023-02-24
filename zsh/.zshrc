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

# Go
export GOPATH=$HOME/Developer/Go
export PATH=$PATH:/usr/local/go/bin

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Deno
export DENO_INSTALL="/Users/russell/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
