return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
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
      local ls = require("luasnip")

      vim.keymap.set({ "i" }, "<C-s>", function() ls.expand() end, { silent = true })
      vim.keymap.set({"i"}, "<C-l>", function()
        if ls.jumpable(1) then
          ls.jump(1)  -- Jump to next placeholder in snippet
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)  -- Move cursor right
        end
      end, {silent = true})
      vim.keymap.set({ "i" }, "<C-j>", function()
        if ls.jumpable(1) then
          ls.jump(1)                                                                                     -- Jump down to next placeholder
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Down>", true, false, true), "n", false) -- Move cursor down
        end
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  }
}

