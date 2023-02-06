# .dotfiles

Uses GNU stow to symlink dotfiles in this repository to the home directory.

## Prerequisites

1. Git
1. GNU Stow

macOS
```
brew install git stow
```

linux
```
sudo apt install git stow
```

## Usage

1. Clone this repo into your home directory.
1. `cd .dotfiles`
1. `stow [git | prezto | vim | jetbrains]`

## Notes

The prezto and zsh dotfiles are already symlinked by prezto. Remove these files before running `stow` so that constomized configurations will be loaded.

`rm .zlogin .zlogout .zprofile .zshenv .zpreztorc .zshrc`
