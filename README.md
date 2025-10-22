# .dotfiles

Uses GNU stow to symlink dotfiles in this repository to the home directory.

## Prerequisites

1. Git
1. GNU Stow
1. starship
1. zoxide
1. fzf
1. mise

## Usage

1. Clone this repo into your home directory.
1. `cd .dotfiles`
1. `stow [git | zsh | lazyvim | jetbrains]`

## Notes

### lazyvim

`rm ~/.config/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config/options.lua`

Need to remove these files to properly symlink the stowed files.

### zprezto

The prezto and zsh dotfiles are already symlinked by prezto. Remove these files before running `stow` so that constomized configurations will be loaded.

`rm .zlogin .zlogout .zprofile .zshenv .zpreztorc .zshrc`

## To do

Need generic locations for zsh plugins to work across macOS and linux.
