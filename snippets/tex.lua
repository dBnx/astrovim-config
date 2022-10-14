local s = require("luasnip.nodes.snippet").S
local i = require("luasnip.nodes.insertNode").I
local t = require("luasnip.nodes.textNode").T

return {
  -- =================    TEXTUAL   ===========================
  s("para", t("\\paragraph{}")),
  -- ================= MATHEMATICAL ===========================
  s(
    "ali",
    t({ "", "\\begin{align}" }),
    i(1),
    t({ "", "\\end{align}" }),
    i(0)
  ),
  s(
    "splitali",
    t({
      "\\end{align}",
      "\\begin{align}"
    }
    )),
  -- =================     META     ===========================
  s("texroot", t("% !TeX root=")),
},
    {}
