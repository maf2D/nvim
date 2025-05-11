return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    palette = {
      moon = {
        base = "#12101A",
        pine = "#75827B",   --dark-blue
        gold = "#D5AE9B",   --gold
        foam = "#C5D7D0",   --light-blue
        rose = "#CFB2AF",   --dark-gold
        love = "#D8657B",   --red
        iris = "#9F8ABA",   --purple
      },
    },

    highlight_groups = {
      Normal = { bg = "none" },
      -- NormalFloat = { bg = "none" },
      NormalNC = { bg = "none" },
      EndOfBuffer = { bg = "none" },
      DiagnosticUnderlineError = { fg = "#d8657b", underline = false, undercurl = true },
      DiagnosticUnderlineHint = { fg = "#d8657b", underline = false, undercurl = true },
      DiagnosticUnderlineInfo = { fg = "#d8657b", underline = false, undercurl = true },
      DiagnosticUnderlineWarn = { fg = "#d8657b", underline = false, undercurl = true },
      SpellBad = { fg = "#d8657b", underline = false, undercurl = false },
      SpellCap = { fg = "#d8657b", underline = false, undercurl = false },
      SpellLocal = { fg = "#d8657b", underline = false, undercurl = false },
      SpellRare = { fg = "#d8657b", underline = false, undercurl = false },
      ["@keyword.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.function.tsx"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.modifier.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.tsx"] = { fg = "pine", bold = true, italic = true },
      ["@constant.builtin.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.operator.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.operator.tsx"] = { fg = "pine", bold = true, italic = true },
      ["QuickFixLine"] = { fg = "foam", bold = true },
      ["QuickFix"] = { bg = "#ffffff", bold = true },
      ["qfFileName"] = { fg = "text", bold = true },
      ["@keyword.import"] = { bold = true, italic = true },
      ["@keyword.return"] = { bold = true, italic = true },
      ["@keyword.conditional.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.conditional.tsx"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.coroutine.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.exception.tsx"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.exception.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.coroutine.tsx"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.type.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@keyword.type.tsx"] = { fg = "pine", bold = true, italic = true },
      ["@variable.typescript"] = { italic = false },
      ["@variable.tsx"] = { italic = false },
      ["@tag.attribute"] = { italic = true },
      ["@keyword.function.typescript"] = { fg = "pine", bold = true, italic = true },
      ["@type.builtin.typescript"] = { bold = true, italic = true, fg = "pine" },
      ["@function.method.call"] = { fg = "rose" },
      -- ["FlashMatch"] = { bg = "NONE" },
      -- ["FlashCurrent"] = { bg = "transparent" },
      -- ["FlashBackdrop"] = { bg = "transparent" },
      ["FlashLabel"] = { bg = "#2A2234", fg = "#ffffff" },
      ["Search"] = { bg = "#2A2234", fg = "#ffffff" },
      ["CurSearch"] = { bg = "#2A2234", fg = "#ffffff" },
      -- ["IncSearch"] = { bg = "#292233", fg = "#ffffff" },
    },
  },
}

