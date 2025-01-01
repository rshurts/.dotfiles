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
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "[U]ndo tree" },
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
        { "<leader>c", group = "Code", mode = { "n", "x" } },
        { "<leader>d", group = "Document" },
        { "<leader>r", group = "Rename" },
        { "<leader>s", group = "Search" },
        { "<leader>w", group = "Workspace" },
        { "<leader>t", group = "Toggle" },
        { "<leader>h", group = "Git hunk", mode = { "n", "v" } },
      },
    },
  },

  -- TODO: switch to neo-tree
  -- tree explorer
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader><Tab>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    opts = {
      git = {
        ignore = false,
      },
      renderer = {
        icons = {
          git_placement = "after",
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "",
            folder = {
              arrow_closed = "▶",
              arrow_open = "▼",
              default = "▶",
              open = "▼",
              empty = "▷",
              empty_open = "▽",
              symlink = "▷",
              symlink_open = "▽",
            },
            git = {
              unstaged = "○",
              staged = "◉",
              unmerged = "●",
              renamed = "→",
              untracked = "◌",
              deleted = "✗",
              ignored = "",
            },
          },
          show = {
            file = false,
            folder = false,
          },
          symlink_arrow = " → ",
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
          "nvim-tree", -- TODO: switch to neo-tree
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
}
