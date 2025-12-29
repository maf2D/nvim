local function open_git_window(git_cmd)
  -- close any existing fugitive/git windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    local bufname = vim.api.nvim_buf_get_name(buf)

    local is_fugitive = (ft == "fugitive" or ft == "git" or bufname:match("^fugitive://") or bufname:match("^git://"))
    if is_fugitive then
      vim.api.nvim_win_close(win, false)
    end
  end

  -- open new git window
  vim.cmd("vertical " .. git_cmd)
  local total_width = vim.o.columns
  local git_width = math.floor(total_width * 0.5)
  vim.cmd("vertical resize " .. git_width)
end

return {
  "tpope/vim-fugitive",
  keys = {
    {
      "<leader>gst",
      function()
        open_git_window("Git")
      end,
      mode = { "n" }
    },
    {
      "<leader>ga",
      function()
        vim.cmd("Git add .")
      end,
      mode = { "n" }
    },
    {
      "<leader>gcm",
      function()
        open_git_window("Git commit")
      end,
      mode = { "n" }
    },
    -- {
    --   "<leader>gRS",
    --   function()
    --     vim.cmd("Git reset")
    --   end,
    --   mode = { "n" }
    -- },
    {
      "<leader>gl",
      function()
        open_git_window("Git log")
      end,
      mode = { "n" }
    },
  }
}
