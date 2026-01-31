local LspConfig = {}

LspConfig.ensure_installed = {
  "lua_ls",
  "ts_ls",
}

LspConfig.formatters_by_ft = {}

function LspConfig:setup()
  self:setup_conform()
  self:setup_fidget()
  self:setup_mason()
  self:setup_cmp()
  self:setup_diagnostics()
end

function LspConfig:setup_conform()
  require("conform").setup({
    formatters_by_ft = self.formatters_by_ft
  })
end

function LspConfig:setup_fidget()
  require("fidget").setup({})
end

function LspConfig:get_capabilities()
  local cmp_lsp = require("cmp_nvim_lsp")

  return vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
  )
end

function LspConfig:setup_mason()
  local capabilities = self:get_capabilities()

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = self.ensure_installed,
    handlers = self:get_server_handlers(capabilities)
  })
end

function LspConfig:get_server_handlers(capabilities)
  local lspconfig = require("lspconfig")

  return {
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities
      })
    end,

    zls = function()
      lspconfig.zls.setup({
        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
        settings = {
          zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
          },
        },
      })
      vim.g.zig_fmt_parse_errors = 0
      vim.g.zig_fmt_autosave = 0
    end,

    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
              globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            }
          }
        }
      })
    end,
  }
end

function LspConfig:setup_cmp()
  local cmp = require("cmp")
  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    })
  })
end

function LspConfig:setup_diagnostics()
  vim.diagnostic.config({
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

return LspConfig
