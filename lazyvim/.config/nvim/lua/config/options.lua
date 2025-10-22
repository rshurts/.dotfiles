-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.opt

g.lazyvim_prettier_needs_config = true
g.snacks_animate = false

o.list = true -- show trailing whitespace, tabs, and long lines
o.listchars = { tab = "▸ ", trail = "▫", extends = "→", precedes = "←", nbsp = "␣" }
