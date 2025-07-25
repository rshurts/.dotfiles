return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy find help" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Fuzzy find keymaps" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files" })
      vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy find git files" })
      vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Fuzzy find select telescope" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Fuzzy find current word" })
      vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Fuzzy find by live grep" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Fuzzy find diagnostics" })
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Fuzzy find resume" })
      vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Fuzzy find recent files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find in buffers" })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "Fuzzily search in current buffer" })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>f/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "Fuzzy find in open Files" })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "Fuzzy find Neovim files" })
    end,
  },
}
