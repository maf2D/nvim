local TreesitterConfig = require("deckrow.lib.treesitter-config")

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    TreesitterConfig:setup()
  end
}
