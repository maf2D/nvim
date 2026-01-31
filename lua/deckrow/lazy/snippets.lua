local SnippetNav = require("deckrow.lib.snippet-nav")

return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_lua").load({
          paths = "~/.config/nvim/lua/deckrow/snippets"
        })
      end
    },
    config = function()
      SnippetNav:setup()

      vim.keymap.set({ "i" }, "<C-s>", function() SnippetNav:expand() end, { silent = true })
      vim.keymap.set({ "i" }, "<C-l>", function() SnippetNav:jump_or_move_right() end, { silent = true })
      vim.keymap.set({ "i" }, "<C-j>", function() SnippetNav:jump_or_move_down() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function() SnippetNav:change_choice() end, { silent = true })
    end,
  }
}
