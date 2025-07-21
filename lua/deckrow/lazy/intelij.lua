return {
  "chiendo97/intellij.vim",
  config = function()
    local function make_italic(group)
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      if ok then
        hl.italic = true
        hl.bold = true
        vim.api.nvim_set_hl(0, group, hl)
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "intellij",
      callback = function()
        make_italic("@keyword")
        make_italic("@keyword.return")
        make_italic("@keyword.function")
        make_italic("@keyword.operator")
        make_italic("@keyword.coroutine.typescript")
        make_italic("@variable.builtin.typescript")

        local overrides = {
          FlashLabel = { bg = "#2A2234", fg = "#ffffff" },
          Search = { bg = "#2A2234", fg = "#ffffff" },
          CurSearch = { bg = "#2A2234", fg = "#ffffff" },
        }

        for group, opts in pairs(overrides) do
          vim.api.nvim_set_hl(0, group, opts)
        end
      end,
    })

    -- vim.cmd.colorscheme("intellij")
  end,
}
