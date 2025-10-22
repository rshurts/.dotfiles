return {
  -- remove buffer tabs
  { "akinsho/bufferline.nvim", enabled = false },

  -- keep the classic command line
  { "folke/noice.nvim", enabled = false },

  -- use the full bottom of the screen
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },

  -- turn off the clock
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },

  -- turn off all the extra snippets in completions
  { "rafamadriz/friendly-snippets", enabled = false },

  {
    "saghen/blink.cmp",
    opts = {
      appearance = {
        -- use large icon variant
        nerd_font_variant = "normal",
      },
      keymap = {
        -- use standard completion keymap
        preset = "default",
        ["<C-y>"] = { "select_and_accept" },
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      -- start up with a blank screen
      dashboard = { enabled = false },
      -- show hidden files
      explorer = {
        hidden = true,
        ignored = true,
      },
      picker = {
        hidden = true,
        ignored = true,
      },
    },
  },
}
