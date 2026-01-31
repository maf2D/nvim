local GitWindow = require("deckrow.lib.git-window")

return {
  "tpope/vim-fugitive",
  keys = {
    {
      "<leader>gst",
      function() GitWindow:open("Git") end,
      mode = { "n" }
    },
    {
      "<leader>ga",
      function() vim.cmd("Git add .") end,
      mode = { "n" }
    },
    {
      "<leader>gcm",
      function() GitWindow:open("Git commit") end,
      mode = { "n" }
    },
    {
      "<leader>gl",
      function() GitWindow:open("Git log") end,
      mode = { "n" }
    },
  },
}
