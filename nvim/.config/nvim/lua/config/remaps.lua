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
k.set("x", "<leader>p", [["_dP]], { desc = "Put and keep the yank register" })

-- keep the yank register when deleting a character
k.set("n", "x", [["_x]])

-- deal with word wrap
k.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
k.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move between splits
k.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left split" })
k.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right split" })
k.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower split" })
k.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper split" })

-- resize splits using <ctrl> arrow keys
k.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase split height" })
k.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease split height" })
k.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease split width" })
k.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase split width" })

-- highlights
k.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" }) -- Clear highlights on search when pressing <Esc> in normal mode
