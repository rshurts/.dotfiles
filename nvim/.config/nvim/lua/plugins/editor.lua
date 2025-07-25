return {
  -- colorscheme
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            constants = "bold",
          },
        },
      })
      vim.cmd("colorscheme nightfox")
    end,
  },

  -- detect tabstop and shiftwidth automatically
  {
    "tpope/vim-sleuth",
  },

  -- comment shortcuts
  {
    "numToStr/comment.nvim",
    config = true,
  },

  -- highlight todo comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  -- indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- visualize undo history
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
    },
  },

  -- keybinding popup
  {
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        mappings = false,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },

      -- Document existing key chains
      spec = {
        { "<leader>f", group = "Fuzzy Find" },
        { "<leader>t", group = "Toggle" },
        { "<leader>b", group = "Buffer" },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>c", group = "Code", mode = { "n", "x" } },
      },
    },
  },

  -- tree explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "\\", ":Neotree reveal<CR>", desc = "Neotree reveal", silent = true },
    },
    opts = {
      default_component_configs = {
        diagnostics = {
          symbols = {
            hint = "■",
            info = "■",
            warn = "■",
            error = "■",
          },
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          },
        },
        indent = {
          expander_collapsed = "▷",
          expander_expanded = "▽",
        },
        icon = {
          folder_closed = "▶",
          folder_open = "▼",
          folder_empty = "▷",
          folder_empty_open = "▽",
          default = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            modified = "",
            deleted = "",
            renamed = "",
            -- Status type
            untracked = "○",
            ignored = "",
            unstaged = "●",
            staged = "◉",
            conflict = "■",
          },
        },
        symlink_target = {
          enabled = true,
          text_format = " → %s", -- %s will be replaced with the symlink target's path.
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignore = true,
          hide_hidden = true,
        },
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
      },
    },
  },

  -- stylized status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end

      require("lualine").setup({
        extensions = {
          "fugitive",
          "neo-tree",
        },
        sections = {
          lualine_b = {
            { "diff", source = diff_source },
            { "b:gitsigns_head", icon = "" },
            {
              "diagnostics",
              symbols = { error = "■", warn = "■", hint = "■", info = "■" },
            },
          },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype" },
        },
      })
    end,
  },

  -- utilies
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.pairs").setup()
      require("mini.surround").setup()
    end,
  },
}
