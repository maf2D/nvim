local GitWindow = {}

GitWindow.width_ratio = 0.5

function GitWindow:open(git_cmd)
  self:close_existing()
  self:open_vertical_split(git_cmd)
  self:resize()
end

function GitWindow:close_existing()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)

    if self:is_fugitive_buffer(buf) then
      vim.api.nvim_win_close(win, false)
    end
  end
end

function GitWindow:is_fugitive_buffer(buf)
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  local bufname = vim.api.nvim_buf_get_name(buf)

  return ft == "fugitive"
    or ft == "git"
    or bufname:match("^fugitive://")
    or bufname:match("^git://")
end

function GitWindow:open_vertical_split(git_cmd)
  vim.cmd("vertical " .. git_cmd)
end

function GitWindow:resize()
  local width = math.floor(vim.o.columns * self.width_ratio)
  vim.cmd("vertical resize " .. width)
end

return GitWindow
