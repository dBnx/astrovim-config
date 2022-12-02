local s = require("luasnip.nodes.snippet").S
local i = require("luasnip.nodes.insertNode").I
local t = require("luasnip.nodes.textNode").T

return {
  -- =================    TEXTUAL   ===========================
  s("para", t("\\paragraph{}")),
  -- =================    SYMBOLS   ===========================
  s("pi", t("\\pi{}")),
  s("gamma", t("\\gamma{}")),
  s("delta", t("\\delta{}")),
  s("Omega", t("\\Omega{}")),
  s("lra", t("\\Leftrightarrow")),
  s("la", t("\\Leftarrow")),
  s("ra", t("\\Rightarrow")),
  -- ================= MATHEMATICAL ===========================
  s("mk", { t("\\("), i(1), t("\\)"), i(0) }),
  s("sqrt", { t("\\sqrt{ "), i(1), t(" }"), i(0) }),
  s("dot", { t("\\dot{ "), i(1), t(" }"), i(0) }),
  s("vec", { t("\\vec{ "), i(1), t(" }"), i(0) }),
  s("frac", { t("\\frac{ "), i(1), t(" }{ "), i(2), t(" }"), i(0) }),
  s(
    "ali",
    { t({ "", "\\begin{align}" }),
      i(1),
      t({ "", "\\end{align}" }),
      i(0)
    }
  ),
  s(
    "splitali",
    { t({
      "\\end{align}",
      "\\begin{align}"
    }
    ) }
  ),
  -- =================     META     ===========================
  s("texroot", { t("% !TeX root="), i(0) }),
  s("use", { t("\\usepackage{"), i(1), t("}"), i(0) }),
  s("includegraphics", { t("\\includegraphics[width=\\textwidth]{"), i(1, "example-image-a"), t("}"), i(0) }),
  -- =================     TEMPLATES     ===========================
  s("subfigure", { t(--
    "\\begin{subfigure}[b]{0.49\\textwidth}"--
    , "\t\\centering"--
    , "\t\\includegraphics[width=\\textwidth]{example-image-a}"--
    , "\t\\caption{}%"--
    , "\\end{subfigure}"--
  ) }),
},
    {
      s("mkk", { t("\\("), i(1), t("\\)"), i(0) }),
    }
