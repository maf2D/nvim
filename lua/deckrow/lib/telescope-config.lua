local TelescopeConfig = {}

TelescopeConfig.excluded_dirs = { ".git", "node_modules", "dist", "build" }

function TelescopeConfig:setup(opts)
  require("telescope").setup(opts)
  require("telescope").load_extension("ui-select")
end

function TelescopeConfig:get_opts()
  local actions = require("telescope.actions")
  local themes = require("telescope.themes")

  return {
    extensions = {
      ["ui-select"] = {
        themes.get_dropdown({
          layout_config = {
            width = 0.8,
            height = 20,
            prompt_position = "bottom",
          },
        }),
      },
    },
    defaults = {
      layout_strategy = "vertical",
      previewer = false,
      path_display = { "relative" },
      layout_config = {
        preview_cutoff = 0,
        preview_height = 0.6,
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<Tab>"] = function(prompt_bufnr)
            actions.select_default(prompt_bufnr)
          end,
        },
      }
    }
  }
end

function TelescopeConfig:get_keys()
  return {
    { "<leader>pr", function() self:oldfiles() end, desc = "Recent Files" },
    { "<leader>pb", function() self:buffers() end, desc = "Buffers" },
    { "<leader>ps", function() self:live_grep() end, desc = "Live Grep" },
    { "<leader>pc", function() self:grep_string() end, desc = "Grep Current Word" },
    { "<leader>pg", function() self:git_status() end, desc = "Git Status" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
    { "<leader>pf", function() self:find_files() end, desc = "Find Files" },
    { "<leader>pF", function() self:find_directories() end, desc = "Find Directory" },
    { "<leader>pws", function() self:grep_cword() end, desc = "Grep Word (cword)" },
    { "<leader>pWs", function() self:grep_cWORD() end, desc = "Grep WORD (cWORD)" },
    { "<leader>vh", function() self:help_tags() end, desc = "Help Tags" },
    { "<leader>pl", function() self:lsp_document_symbols() end, desc = "LSP Document Symbols" },
  }
end

function TelescopeConfig:oldfiles()
  require("telescope.builtin").oldfiles()
end

function TelescopeConfig:buffers()
  require("telescope.builtin").buffers()
end

function TelescopeConfig:live_grep()
  require("telescope.builtin").live_grep()
end

function TelescopeConfig:grep_string()
  require("telescope.builtin").grep_string()
end

function TelescopeConfig:git_status()
  require("telescope.builtin").git_status()
end

function TelescopeConfig:find_files()
  local find_command = {
    "fd",
    "--type", "f",
    "--hidden",
    "--no-ignore",
  }

  for _, dir in ipairs(self.excluded_dirs) do
    table.insert(find_command, "--exclude")
    table.insert(find_command, dir)
  end

  require("telescope.builtin").find_files({
    find_command = find_command
  })
end

function TelescopeConfig:find_directories()
  require("telescope.builtin").find_files({
    prompt_title = "Find Directory",
    find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" }
  })
end

function TelescopeConfig:grep_cword()
  local word = vim.fn.expand("<cword>")
  require("telescope.builtin").grep_string({ search = word })
end

function TelescopeConfig:grep_cWORD()
  local word = vim.fn.expand("<cWORD>")
  require("telescope.builtin").grep_string({ search = word })
end

function TelescopeConfig:help_tags()
  require("telescope.builtin").help_tags()
end

function TelescopeConfig:lsp_document_symbols()
  require("telescope.builtin").lsp_document_symbols()
end

return TelescopeConfig
