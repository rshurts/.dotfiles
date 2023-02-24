require("config.options")
require("config.remaps")
require("config.lazy")

-- disable netrw at the start for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- appropriately highlight codefences returned from denols
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}
