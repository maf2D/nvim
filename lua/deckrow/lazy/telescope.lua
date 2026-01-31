local TelescopeConfig = require("deckrow.lib.telescope-config")

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  config = function()
    TelescopeConfig:setup(TelescopeConfig:get_opts())
  end,
  keys = TelescopeConfig:get_keys()
}
