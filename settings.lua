local config = {

  -- Set colorscheme
  colorscheme = "onedark",

  -- Add plugins
  plugins = {
    { "dstein64/vim-startuptime" },
    {
      'mvllow/modes.nvim',
      config = function()
        vim.opt.cursorline = true
        require'modes'.setup({
          set_cursor = true,
        })
      end,
    },
    {
      "nvim-lua/lsp_extensions.nvim",
      config = function()
        vim.cmd [[ autocmd CursorMoved,InsertLeave,BufEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = '\t» ', highlight = "Comment", aligned = false, enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]
      end,
    },
    {
      "zegervdv/nrpattern.nvim",
      config = function()
        local ok, patterns = pcall(require, "user.patterns")
        if ok then
          require"nrpattern".setup(patterns)
        else
          print("Error reading user.patterns - using defaults")
          require"nrpattern".setup()
        end
      end,
    },
  },

  overrides = {
    treesitter = {
      ensure_installed = { "lua" },
    },
  },

  -- Diagnostics option
  diagnostics = {
    enable = true,
    text = "none",
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    nvim_tree = true,
    lualine = true,
    lspsaga = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  packer_file = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",

  polish = function()
    local set = vim.opt

    -- Set options
    set.relativenumber = true

    -- Set key bindings
    local keybindings_ok, keybindings_err = pcall(require, "user.keybindings")
    if not keybindings_ok then
      print("Error loading custom keybindings:\n" .. keybindings_err )
    end

    -- Load custom snippets
    local snippets_ok, snippets_err = pcall(require, "user.snippets")
    if not snippets_ok then
      print("Error loading custom snippets:\n" .. snippets_err)
    end

    -- Load custom lsp configs
    local lsp_ok, lsp_err = pcall(require, "user.lsp")
    if not lsp_ok then
      print("Error loading custom lsp settings:\n" .. lsp_err)
    end
     
    -- Load custom gui configs
    local gui_ok, gui_err = pcall(require, "user.gui")
    if not gui_ok then
      print("Error loading custom lsp settings:\n" .. gui_err)
    end
    
    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
    --require'lspconfig'.zeta_note.setup{
    --  cmd = {'/home/dave/.cargo/bin/zeta-note'}
    --}
  end,
}

return config
