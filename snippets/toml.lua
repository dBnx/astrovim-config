local s = require("luasnip.nodes.snippet").S
local i = require("luasnip.nodes.insertNode").I
local t = require("luasnip.nodes.textNode").T

return {
  -- =================     TEMPLATES     ===========================
  s("workspace", { t(--
    "[workspace]"
    , "resolver = \"2\""
    , "members = ["
    , "\")"), i(0, "common")
    , t("common\","
      , "]"--
    ) }),
}, {
}
