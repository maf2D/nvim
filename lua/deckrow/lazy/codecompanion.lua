return {
  "olimorris/codecompanion.nvim",
  opts = { },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("codecompanion").toggle()
      end,
      desc = "Toggle CodeCompanion",
      mode = { "n", "v" },
    },
    {
      "<leader>av",
      ":CodeCompanion ",
      desc = "Visual Actions (CodeCompanion)",
      mode = { "v" },
    },
  },
}
