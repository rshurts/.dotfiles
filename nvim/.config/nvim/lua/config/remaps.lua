local k = vim.keymap

-- leader
vim.g.mapleader = " "

-- kj to quickly leave insert mode
k.set("i", "kj", "<esc>")

-- center cursor on up & down
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")

-- center cursor on next & previous selection
k.set("n", "n", "nzz")
k.set("n", "N", "Nzz")

-- keep the yank register when putting
k.set("x", "<leader>p", [["_dP]])

-- keep the yank register when deleting a character
k.set("n", "x", [["_x]])

-- deal with word wrap
k.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
k.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- splits
k.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
k.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
k.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
k.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- highlights
k.set("n", "<leader>nn", ":nohl<cr>")
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode
