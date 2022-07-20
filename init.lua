return {
  colorscheme = "duskfox",

  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      emoji = 700,
      pandoc_references = 700,
      latex_symbols = 700,
      calc = 650,
      path = 500,
      buffer = 250,
    },
  },

  polish = function()
    vim.opt.timeoutlen = 180

    local keybindings_ok, keybindings_err = pcall(require, "user.mappings")
    if not keybindings_ok then print("Error loading custom keybindings:\n" .. keybindings_err) end

    local autocmds_ok, autocmds_err = pcall(require, "user.autocmds")
    if not autocmds_ok then print("Error loading custom autocmds:\n" .. autocmds_err) end

    vim.cmd [[
      let g:grammarous#show_first_error = 0
      let g:grammarous#hooks = {}
      function! g:grammarous#hooks.on_check(errs) abort
          nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
          nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
      endfunction

      function! g:grammarous#hooks.on_reset(errs) abort
          nunmap <buffer><C-n>
          nunmap <buffer><C-p>
      endfunction
      let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'tex' : 0,
            \ }
    ]]
    --vim.cmd [[
    --  let g:languagetool_server_jar='$HOME/.local/share/languagetool/languagetool-server.jar'
    --  autocmd Filetype tex LanguageToolSetUp
    --  hi LanguageToolGrammarError  guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=blue term=underline cterm=none
    --  hi LanguageToolSpellingError guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
    --]]

    local luasnip_avail, luasnip = pcall(require, "luasnip") --"luasnip"
    --print("Status:", luasnip_avail, "\n", luasnip)
    if luasnip_avail then
      --local M = luasnip.config
      --M["enable_autosnippets"] = true
      --M["delete_check_events"] = "TextChanged"
      --luasnip.config.set_config(M)
      -- TODO: Fix paths!
      --require("luasnip.loaders.from_lua").load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
      --print "YAY Loaded custom snippets"
      --options = {
      --  enable_autosnippets = true,
      --  lua
      --},
      --
      local ls = luasnip
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      --local types = require "luasnip.util.types"
      --local sp = require "luasnip.nodes.snippetProxy"
      ls.add_snippets("all", {
        s("aternary", {
          -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
          i(1, "cond"),
          t " ? ",
          i(2, "then"),
          t " : ",
          i(3, "else"),
        }),
      }, { type = "autosnippets" })
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
      vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()]]
      --require("luasnip.loaders.from_lua").load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
      require("luasnip.loaders.from_lua").load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
      --ls.loader.from_lua.load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
    end
  end,

  luasnip = {
    history = true,
    enable_autosnippets = true,
    vscode_snippet_paths = {
      "/home/dave/.config/nvim/lua/user/snippets",
    },
    --delete_check_events = "TextChanged,TextChangedI",
  },

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },
}
