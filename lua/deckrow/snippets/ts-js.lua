local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local snippets = {
  s("imp", {
    t("import "), i(1, "module"), t(" from "), i(2, "'module';")
  }),

  s("log", {
    t("console.log("), i(1), t(");")
  }),

  s("fn", {
    t("function "), i(1), t("("), i(2), t(") {"),
    t({"", "\t"}), i(0),
    t({"", "}"})
  }),

  s("afn", {
    t("const "), i(1), t(" = ("), i(2), t(") => {"),
    t({"", "\t"}), i(0),
    t({"", "};"})
  }),

  s("cfn", {
    t("("), i(1), t(") => {"),
    t({"", "\t"}), i(0),
    t({"", "}"})
  }),

  s("ifwrap", {
    t("if ("), i(1, "condition"), t(") {\n  "),
    f(function(_, parent)
      return parent.env.SELECT_RAW[1] or ""
    end, {}),
    t("\n}")
  })
}

ls.add_snippets("typescript", snippets)
ls.add_snippets("javascript", snippets)
ls.add_snippets("typescriptreact", snippets)
