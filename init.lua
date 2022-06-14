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
    if not keybindings_ok then
      print("Error loading custom keybindings:\n" .. keybindings_err)
    end

    local autocmds_ok, autocmds_err = pcall(require, "user.autocmds")
    if not autocmds_ok then
      print("Error loading custom autocmds:\n" .. autocmds_err)
    end

    local luasnip_avail, luasnip = pcall(require, "luasnip")
    if luasnip_avail then
      local M = luasnip.config
      M["enable_autosnippets"] = true
      M["delete_check_events"] = "TextChanged"
      luasnip.config.set_config(M)
      -- TODO: Fix paths!
      require("luasnip.loaders.from_lua").load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
      --options = {
      --  enable_autosnippets = true,
      --  lua
      --},
      --
    end
  end,

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
