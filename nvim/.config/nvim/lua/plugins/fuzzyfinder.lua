return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag="0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = { "make" },
      },
    },
    keys = {
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files() end,
        desc = "Fuzzy find project files",
      },
      {
        "<leader>fg",
        function() require("telescope.builtin").git_files() end,
        desc = "Fuzzy find git files",
      },
      {
        "<leader>fl",
        function() require("telescope.builtin").live_grep() end,
        desc = "Search for a string in CWD",
      }
    },
    config = true,
  },
}
