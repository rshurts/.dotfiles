return {
  -- treesitter with auto-tag
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "css",
          "dockerfile",
          "go",
          "graphql",
          "help",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "prisma",
          "python",
          "rust",
          "scss",
          "toml",
          "typescript",
          "tsx",
          "vim",
          "yaml",
        },
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,
        highlight = {
          enable = true,
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        -- enable autotagging with nvim-ts-autotag
        autotag = {
          enable = true,
        },
      })
    end,
  },
}
