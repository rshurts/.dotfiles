local k = vim.keymap

-- leader
vim.g.mapleader = " "

-- kj to quickly leave insert mode
k.set("i", "kj", "<esc>")

-- center cursor on up & down
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")

-- keep the yank register when putting
k.set("x", "<leader>p", [["_dP]])

-- keep the yank register when deleting a character
k.set("n", "x", [["_x]])

-- deal with word wrap
k.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
k.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- splits
k.set("n", "<leader>h", "<C-w>h")
k.set("n", "<leader>j", "<C-w>j")
k.set("n", "<leader>k", "<C-w>k")
k.set("n", "<leader>l", "<C-w>l")

-- highlights
k.set("n", "<leader>nn", ":nohl<cr>")
