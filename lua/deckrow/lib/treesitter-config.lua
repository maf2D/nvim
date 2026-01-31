local TreesitterConfig = {}

TreesitterConfig.ensure_installed = {
  "vimdoc", "javascript", "typescript", "c", "lua", "rust",
  "jsdoc", "bash",
}

TreesitterConfig.max_filesize = 100 * 1024 -- 100 KB

function TreesitterConfig:setup()
  self:setup_treesitter()
  self:setup_custom_parsers()
end

function TreesitterConfig:setup_treesitter()
  require("nvim-treesitter.configs").setup({
    ensure_installed = self.ensure_installed,
    sync_install = false,
    auto_install = true,
    indent = {
      enable = true
    },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        return self:should_disable_highlight(lang, buf)
      end,
      additional_vim_regex_highlighting = { "markdown" },
    },
  })
end

function TreesitterConfig:should_disable_highlight(lang, buf)
  if lang == "html" then
    return true
  end

  return self:is_large_file(buf)
end

function TreesitterConfig:is_large_file(buf)
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

  if ok and stats and stats.size > self.max_filesize then
    vim.notify(
      "File larger than 100KB treesitter disabled for performance",
      vim.log.levels.WARN,
      { title = "Treesitter" }
    )
    return true
  end

  return false
end

function TreesitterConfig:setup_custom_parsers()
  self:add_templ_parser()
end

function TreesitterConfig:add_templ_parser()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.templ = {
    install_info = {
      url = "https://github.com/vrischmann/tree-sitter-templ.git",
      files = { "src/parser.c", "src/scanner.c" },
      branch = "master",
    },
  }

  vim.treesitter.language.register("templ", "templ")
end

return TreesitterConfig
