local luasnip_avail, luasnip = pcall(require, "luasnip") --"luasnip"
-- print("Status:", luasnip_avail, "\n", luasnip)
if luasnip_avail then
  --local M = luasnip.config
  --M["enable_autosnippets"] = true
  --M["delete_check_events"] = "TextChanged"
  --luasnip.config.set_config(M)
  -- TODO: Fix paths!
  require("luasnip.loaders.from_lua").load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
  -- print "YAY Loaded custom snippets"
  --options = {
  --  enable_autosnippets = true,
  --  lua
  --},
  --
  --local ls = require "luasnip"
  local ls = luasnip
  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node
  ls.add_snippets("all", {
    s("ternary", {
      -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
      i(1, "cond"),
      t " ? ",
      i(2, "then"),
      t " : ",
      i(3, "else"),
    }),
  })
end
