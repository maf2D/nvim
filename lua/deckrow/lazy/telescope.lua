return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown()
            }
          }
        })
        require("telescope").load_extension("ui-select")
      end,
    }
  },
  opts = {
    defaults = {
      previewer = false,

      mappings = {
        i = {
          ["<C-j>"] = require('telescope.actions').move_selection_next,
          ["<C-k>"] = require('telescope.actions').move_selection_previous,
          ["<Tab>"] = function(prompt_bufnr)
            local picker = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
            require('telescope.actions').select_default(prompt_bufnr)
          end,
        },
      }
    }
  },
  keys = {
    { "<leader>pf", function() require("telescope.builtin").find_files() end,  desc = "Find Files" },
    { "<leader>pr", function() require("telescope.builtin").oldfiles() end,    desc = "Recent Files" },
    { "<leader>pb", function() require("telescope.builtin").buffers() end,     desc = "Buffers" },
    { "<leader>ps", function() require("telescope.builtin").live_grep() end,   desc = "Live Grep" },
    { "<leader>pc", function() require("telescope.builtin").grep_string() end, desc = "Grep Current Word" },
    { "<leader>pg", function() require("telescope.builtin").git_status() end,  desc = "Git Status" },
    -- alternative:
    -- { "<leader>pg", function() require("telescope.builtin").git_files({ show_untracked = false }) end, desc = "Git Files" },

    {
      "<leader>pws",
      function()
        local word = vim.fn.expand("<cword>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      desc = "Grep Word (cword)"
    },

    {
      "<leader>pWs",
      function()
        local word = vim.fn.expand("<cWORD>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      desc = "Grep WORD (cWORD)"
    },

    { "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" }
  }
}
