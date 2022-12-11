--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

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
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true,
      number = true,
      spell = false,
      spelllang = "en,de,fr",
      signcolumn = "yes", -- default: "auto"
      wrap = false,
      smartindent = true,
      smartcase = true,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      tex_comment_nospell = true,
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = require 'user.header',

  -- Default theme configuration
  default_theme = require 'user.default_theme',

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = require 'user.lsp',

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = require 'user.mappings',

  -- Configure plugins
  plugins = require 'user.plugins',

  -- LuaSnip Options
  luasnip = {
    enable_autosnippets = true, -- CHECK IF IT DOES SMTH
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'tectonic'
    vim.cmd [[
      command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
    ]]
    -- Set up custom filetypes
    vim.filetype.add {
      extension = {
        plaintex = "tex",
      },
      --   filename = {
      --     ["Foofile"] = "fooscript",
      --   },
      --   pattern = {
      --     ["~/%.config/foo/.*"] = "fooscript",
      --   },
    }
    local ls = require 'luasnip'
    local config = ls.config
    config.enable_autosnippets = true
    ls.config.setup(config)
    --ls.config.setup({ enable_autosnippets = true })
    ls.add_snippets("all", require 'user.snippets.all')
    ls.add_snippets("tex", require 'user.snippets.tex')
    ls.add_snippets("python", require 'user.snippets.python')
    --require("luasnip.loaders.from_lua").lazy_load({
    --  paths = { "~/.config/nvim/lua/user/snippets_lua" },
    --  override_priority = true,
    --})
    --require("luasnip.loaders.from_vscode").load({
    --  paths = { "./lua/user/snippets_vs" },
    --  override_priority = true,
    --})
    --require 'luasnip.loaders.from_snipmate'.lazy_load({
    --  paths = { "./lua/user/snippets_mate" },
    --  override_priority = true,
    --})
    vim.cmd [[
     noremap <silent> k gk
     noremap <silent> j gj
     noremap <silent> 0 g0
     noremap <silent> $ g$
    ]]
  end,
}

return config
