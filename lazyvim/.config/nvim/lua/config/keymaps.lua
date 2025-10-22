-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local key = vim.keymap

-- kj to quickly leave insert mode
key.set("i", "kj", "<esc>")
-- kj to quickly leave visual mode
key.set("v", "kj", "<esc>")

-- center cursor on up & down
key.set("n", "<C-d>", "<C-d>zz")
key.set("n", "<C-u>", "<C-u>zz")

-- center cursor on next & previous selection
key.set("n", "n", "nzz")
key.set("n", "N", "Nzz")

-- keep the yank register when putting
key.set("x", "<leader>p", [["_dP]], { desc = "Put and keep the yank register" })

-- keep the yank register when deleting a character
key.set("n", "x", [["_x]])

-- deal with word wrap
key.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights on search when pressing <Esc> in normal mode
key.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
