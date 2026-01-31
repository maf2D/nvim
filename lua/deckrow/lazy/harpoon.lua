return {
  "theprimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  branch = 'harpoon2',
  config = function()
    local harpoon = require("harpoon")
    local toggle_harpoon_menu_with_custom_settings

    harpoon:setup()

    vim.keymap.set("n", "<leader>h", function() toggle_harpoon_menu_with_custom_settings() end)
    vim.keymap.set("n", "<leader>a", function() harpoon:list():prepend() end)
    vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-m>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader><C-j>", function() harpoon:list():replace_at(1) end)
    vim.keymap.set("n", "<leader><C-k>", function() harpoon:list():replace_at(2) end)

    -- helpers
    toggle_harpoon_menu_with_custom_settings = function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), {
        border = "rounded",
        title = { { " Harpoon ", "TelescopePreviewTitle" } },
        title_pos = "center",
        ui_width_ratio = 0.6,
      })
    end
  end
}
