local SnippetNav = {}

function SnippetNav:setup()
  local ls = require("luasnip")
  self.ls = ls
end

function SnippetNav:expand()
  self.ls.expand()
end

function SnippetNav:jump_or_move_right()
  if self.ls.jumpable(1) then
    self.ls.jump(1)
  else
    self:feed_key("<Right>")
  end
end

function SnippetNav:jump_or_move_down()
  if self.ls.jumpable(1) then
    self.ls.jump(1)
  else
    self:feed_key("<Down>")
  end
end

function SnippetNav:change_choice()
  if self.ls.choice_active() then
    self.ls.change_choice(1)
  end
end

function SnippetNav:feed_key(key)
  local termcode = vim.api.nvim_replace_termcodes(key, true, false, true)
  vim.api.nvim_feedkeys(termcode, "n", false)
end

return SnippetNav
