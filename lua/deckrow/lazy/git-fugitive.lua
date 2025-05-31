local function open_git_window(git_cmd)
  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  local bufname = vim.api.nvim_buf_get_name(0)

  local is_fugitive = (ft == "fugitive" or ft == "git" or bufname:match("^fugitive://") or bufname:match("^git://"))
  if is_fugitive then
    vim.cmd("close")
  else
    vim.cmd("vertical " .. git_cmd)
    local total_width = vim.o.columns
    local git_width = math.floor(total_width * 0.4)
    vim.cmd("vertical resize " .. git_width)
  end
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
    {
      "<leader>grs",
      function()
        vim.cmd("Git reset")
      end,
      mode = { "n" }
    },
    {
      "<leader>gl",
      function()
        open_git_window("Git log")
      end,
      mode = { "n" }
    },
  }
}
