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
}
