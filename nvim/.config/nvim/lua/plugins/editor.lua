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
            types = "italic,bold",
          },
        },
      })
      vim.cmd("colorscheme nightfox")
    end
  },

  -- comment shortcuts
  {
    "numToStr/comment.nvim",
    config = true,
  },

  -- visualize undo history
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader><Tab>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
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
            removed = gitsigns.removed
          }
        end
      end

      require("lualine").setup({
        extensions = {
          "fugitive",
          "nvim-tree"
        },
        sections = {
          lualine_b = {
            {'diff', source = diff_source},
            { "b:gitsigns_head", icon = "" },
            {
              "diagnostics",
              symbols = { error = '✗', warn = '▰', hint = '▱', info = '✧' },
            },
          },
          lualine_c = { { "filename", path = 1, symbols = { modified = "[+]", readonly = "[RO]" } } },
          lualine_x = {
            "encoding",
            {
              "fileformat",
              icons_enabled = true,
              symbols = {
                unix = "unix",
                dos = "dos",
                mac = "mac",
              },
            },
            "filetype",
          },
        },
      })
    end
  },
}
