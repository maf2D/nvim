require('deckrow.set')
require('deckrow.remap')
require('deckrow.lazy_init')

local augroup = vim.api.nvim_create_augroup
local deckrowGroup = augroup('deckrowGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yankGroup = augroup('highlightYank', {})

autocmd('TextYankPost', {
  group = yankGroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd('ColorScheme', {
  group = deckrowGroup,
  pattern = '*',
  callback = function ()
    vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
    vim.cmd('highlight NonText guibg=NONE ctermbg=NONE')
    vim.cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')
  end
})

autocmd('BufEnter', {
  group = deckrowGroup,
  callback = function()
    vim.cmd.colorscheme('rose-pine-moon')
    -- vim.cmd.colorscheme('intellij')
  end
})

autocmd('LspAttach', {
  group = deckrowGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>ch', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<C-k>', ':cprevious<CR>', { silent = true })
    vim.keymap.set('n', '<C-j>', ':cnext<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', '<leader>crn', function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.splitright = true
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.o.termguicolors = true
vim.o.hlsearch = true
