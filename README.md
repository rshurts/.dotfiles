# .dotfiles

Uses GNU stow to symlink dotfiles in this repository to the home directory.

## Prerequisites

### Homebrew

Install homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Install tooling

`brew install stow gnu-tar wget ripgrep fd zoxide fzf bat neovim git lazygit starship zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search`

### Mise

Intall mise

`curl https://mise.run | sh`

Install tooling

- `mise use -g usage`
- `mise use -g node@lts`
- `mise settings add indiomatic_version_file_enable_tools node`
- `mise completion zsh  > /usr/local/share/zsh/site-functions/_mise`

### Lazyvim

Install Lazyvim

`git clone https://github.com/LazyVim/starter ~/.config/nvim`
`rm -rf ~/.config/nvim/.git`

Remove these files to properly symlink the stowed files.

`rm ~/.config/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config/options.lua`

After stowing the lazyvim config run `nvim` and after install use `:LazyExtras` and add:

- `dap.core`
- `lang.json`
- `lang.markdown`
- `lang.typescript`
- `formatting.prettier`
- `linting.eslint`

## Usage

1. Clone this repo into your home directory.
1. `cd .dotfiles`
1. `stow [git | zsh | lazyvim | jetbrains]`

## Notes

### Jetbrains ideavim on macOS

Allow holding down a key to repeatedly press rather than show alternate characters.

`defaults write com.jetbrains.WebStorm ApplePressAndHoldEnabled -bool false`

### zprezto

The prezto and zsh dotfiles are already symlinked by prezto. Remove these files before running `stow` so that constomized configurations will be loaded.

`rm .zlogin .zlogout .zprofile .zshenv .zpreztorc .zshrc`

## To do

Need generic locations for zsh plugins to work across macOS and linux.
