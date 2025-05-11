local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function capitalize(args)
  local text = args[1][1] or ""
  return text:sub(1,1):upper() .. text:sub(2)
end

ls.add_snippets("typescriptreact", {
  s("ref", {
    t("const "), i(1), t(" = useRef("), i(2), t(");")
  }),

  s("st", {
    t("const ["), i(1), t(", set"), f(capitalize, {1}), t("] = useState("), i(2), t(");")
  }),

  s("eff", {
    t("useEffect(() => {"),
    t({"", "\t" }), i(0),
    t({"", "}, ["}), i(1), t("]);")
  }),
})


