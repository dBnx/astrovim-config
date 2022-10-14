local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

-- Snippet arguments:
-- s({trig="trig",
--   name="IDK if used",
--   dscr="Description",
--   wordTrig= talse, -- if true, the snippet is only expanded if the word ([%w_]+) before the cursor matches the trigger entirely. True by default.
--   regTrig= false, -- whether the trigger should be interpreted as a lua pattern. False by default.
--   -- docstring,
--   -- docTrig,
--   hidden: false,
--   priority: 1000,
--   snippetType
-- })
return {
  s("trig", {
    t ">", i(1), t "< text >", i(2), t "< text again >", i(3)
  })
}, {}
