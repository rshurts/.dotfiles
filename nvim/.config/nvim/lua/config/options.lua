local o = vim.opt

-- config
o.undofile = true -- permant undo history
-- line numbers

o.number = true -- use line numbers
o.relativenumber = true -- user relative line numbers

-- indenting, see after/ftplugin for language specific overrides
o.autoindent = true -- use auto-indenting
o.expandtab = true -- use spaces for tabs
o.shiftwidth = 2 -- use 2 space indents
o.softtabstop = 2 -- insert mode tabs and backspace use 2 spaces
o.tabstop = 2 -- actual tabs use 2 spaces

-- line wrap & whitespace
o.wrap = false
o.list = true -- show trailing whitespace, tabs, and long lines
o.listchars = { tab = "▸ ", trail = "▫", extends = "→", precedes = "←" }

-- search
o.hlsearch = true -- turn on search highlight
o.ignorecase = true -- case insensitive search
o.smartcase = true -- case sensitive search is used if a capital letter is entered
o.incsearch = true -- start searching during typing

-- cursor
o.cursorline = true -- highlight the line the cursor is on
o.scrolloff = 4 -- show lines around cursor
o.mouse = "a" -- allow mouse use everywhere, prevent selecting line numbers

-- appearance
o.updatetime = 100 -- reduce update time
o.signcolumn = "yes" -- always show the sign column
o.termguicolors = true -- use 24-bit color
