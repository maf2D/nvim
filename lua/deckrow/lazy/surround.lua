return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "<leader>sa", -- Add surrounding in Normal and Visual modes
      delete = "<leader>sd", -- Delete surrounding
      find = "<leader>sf", -- Find surrounding (to the right)
      find_left = "<leader>sF", -- Find surrounding (to the left)
      highlight = "<leader>sh", -- Highlight surrounding
      replace = "<leader>sr", -- Replace surrounding
      update_n_lines = "<leader>sn", -- Update `n_lines`
    },
    custom_surroundings = {
      ["("] = { output = { left = "(", right = ")" } },
      ["{"] = { output = { left = "{", right = "}" } },
      ["["] = { output = { left = "[", right = "]" } },
      ["<"] = { output = { left = "<", right = ">" } },
    }
  },
}

