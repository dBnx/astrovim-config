local s = require("luasnip.nodes.snippet").S
local i = require("luasnip.nodes.insertNode").I
local t = require("luasnip.nodes.textNode").T

return {
  -- =================     TEMPLATES     ===========================
  s("add", { t(--
    "impl std::ops::Add for "), i(1, "&Struct"), t(--
    "", "\ttype Output = "), i(2, "Self"), t(--
    "", "\tfn add(self, rhs: Self) -> Self {"
    , "\t"), i(3), t(--
    "", "\t}"--
    , "}"--
  ) }),
  s("add_other", { t(--
    "impl std::ops::Add<"), i(1, "other"), t("> for "), i(2, "&Struct"), t(--
    "", "\ttype Output = "), i(3, "Self"), t(--
    "", "\tfn add(self, rhs: "), i(1), t(") -> Self {"
    , "\t"), i(4), t(--
    "", "\t}"--
    , "}"--
  ) }),
  s("sub", { t(--
    "impl std::ops::Sub for "), i(1, "&Struct"), t(--
    "", "\ttype Output = "), i(2, "Self"), t(--
    "", "\tfn sub(self, rhs: Self) -> Self {"
    , "\t"), i(3), t(--
    "", "\t}"--
    , "}"--
  ) }),
  s("mul", { t(--
    "impl std::ops::Mul for "), i(1, "&Struct"), t(--
    "", "\ttype Output = "), i(2, "Self"), t(--
    "", "\tfn mul(self, rhs: Self) -> Self {"
    , "\t"), i(3), t(--
    "", "\t}"--
    , "}"--
  ) }),
  s("div", { t(--
    "impl std::ops::Div for "), i(1, "&Struct"), t(--
    "", "\ttype Output = "), i(2, "Self"), t(--
    "", "\tfn div(self, rhs: Self) -> Self {"
    , "\t"), i(3), t(--
    "", "\t}"--
    , "}"--
  ) }),
}, {
}
