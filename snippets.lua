
local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local func = ls.function_node
local ins  = ls.insert_node
local dyn = ls.dynamic_node
local choice  = ls.choice_node
local snippet_node = ls.snippet_node

local date_fmt = "%Y-%m-%d"
local time_fmt = "%T" -- "%H:%M:%S"
local iso8601_fmt = "!%Y-%m-%dT%TZ"

ls.config.setup {
	--history = true,
	--store_selection_keys = '<TAB>',
	updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
	--delete_check_events = 'TextChanged,InsertLeave',
}

local tex_it_rec
tex_it_rec = function()
  return snippet_node(
    nil,
    choice(1, {
      text(""),
      snippet_node(nil, {text({"","\t\\item "}), ins(1), dyn(2, tex_it_rec, {}) })
    })
  )
end

ls.snippets = {
  all = {
    snip("date", {
      func(function(_,_) return os.date(date_fmt) end, {}),
    }),
    snip("time", {
      func(function(_,_) return os.date(time_fmt) end, {}),
    }),
    snip("datetime", {
      func(function(_,_) return os.date(iso8601_fmt) end, {}),
    }),
  },
  tex = {
    snip("it", {
      text({"\\begin{itemize}", "\t\\item"}),
      ins(1),
      dyn(2, tex_it_rec, {} ),
      text({"","\\end{itemize}"}),
    })
  },
  rust = {
    snip("deref", {
      text({"impl Deref for "}),
      ins(1),
      text({" {", "\ttype Target: "}),
      ins(2),
      text({";", "\tfn deref(&self) -> &Self::Target {"}),
      ins(2),
      text({"}"}),
    })
  },
}

ls.autosnippets = {
	all = {
		snip("autotrigger", {
			text("autosnippet"),
		}),
		snip("JK", {
			text("{"),
      ins(1),
      text("}"),
      ins(0),
		}),
	}
}

ls.filetype_extend("all", {"_"})

