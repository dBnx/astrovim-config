local s = require("luasnip.nodes.snippet").S
local t = require("luasnip.nodes.textNode").T

local private_ok, private = pcall(require, 'user.snippets.private_info')
if not private_ok then
  private = require('user.snippets.private_info_example')
end

return {
  s("fthint", t("# vim: set ft=sh :")),
  s("JK", t("{}")),
  s("öö", t("{")),
  s("ää", t("}")),
  s("name", t(private.name)),
  s("email", t(private.email)),
  s("phone", t(private.phone)),
}, {
  s("iname", t(private.name)),
  s("iemail", t(private.email)),
  s("iphone", t(private.email)),
}
