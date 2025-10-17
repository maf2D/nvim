return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                      -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" } -- for curl, log and async functions
    },
    build = "make tiktoken",                         -- Only on MacOS or Linux
    opts = {
      model = "claude-sonnet-4.5",
      mappings = {
        complete = {
          insert = "<s-Tab>"
        },
        reset = {
          insert = "<c-r>",
          normal = "<c-r>"
        }
      },
      window = {
        width = 0.4
      }
    },
    -- keys = {
    --   { "<c-s>",      "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    --   { "<leader>ai", "",     desc = "+ai",        mode = { "n", "v" } },
    --   {
    --     "<leader>aa",
    --     function()
    --       return require("CopilotChat").toggle()
    --     end,
    --     desc = "Toggle (CopilotChat)",
    --     mode = { "n", "v" },
    --   },
    --   {
    --     "<leader>ax",
    --     function()
    --       return require("CopilotChat").reset()
    --     end,
    --     desc = "Clear (CopilotChat)",
    --     mode = { "n", "v" },
    --   },
    --   {
    --     "<leader>aq",
    --     function()
    --       vim.ui.input({
    --         prompt = "Quick Chat: ",
    --       }, function(input)
    --         if input ~= "" then
    --           require("CopilotChat").ask(input)
    --         end
    --       end)
    --     end,
    --     desc = "Quick Chat (CopilotChat)",
    --     mode = { "n", "v" },
    --   },
    --   {
    --     "<leader>ap",
    --     function()
    --       require("CopilotChat").select_prompt()
    --     end,
    --     desc = "Prompt Actions (CopilotChat)",
    --     mode = { "n", "v" },
    --   },
    --   {
    --     "<leader>ar",
    --     function()
    --       require("CopilotChat").select_response()
    --     end,
    --     desc = "Response Actions (CopilotChat)",
    --     mode = { "n", "v" },
    --   },
    --   {
    --     "<leader>av",
    --     ":CopilotChat ",
    --     desc = "Visual Actions (CopilotChat)",
    --     mode = { "v" }
    --   },
    -- }
  },
}
