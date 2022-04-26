local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    --diagnostics_style = "none",
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
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

  -- Disable AstroNvim ui features
  ui = {
    -- TODO: What are they doing
    nui_input = true,
    -- telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
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
        requires = { "nvim-lspconfig", "nvim-lsp-installer", "nvim-dap", "Comment.nvim" },
      },
      {
        "simrat39/rust-tools.nvim",
        requires = { "nvim-lspconfig", "nvim-lsp-installer", "nvim-dap", "Comment.nvim" },
        -- Is configured via the server_registration_override installed below!
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
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    luasnip = {
      enable_autosnippets = true,
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings 
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer"},
        }
      }
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

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    server_registration = function(server, server_opts)
      -- Special code for rust.tools.nvim!
      if server.name == "rust_analyzer" then
        local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

        require("rust-tools").setup {
          server = server_opts,
          dap = {
            adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
        vim.cmd [[ autocmd CursorMoved,InsertLeave,BufEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = '\t» ', highlight = "Comment", aligned = false, enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]
      else
        server:setup(server_opts)
      end
    end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local set = vim.opt
    local g = vim.g
    g["tex_flavor"] = "latex"

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
      print("Error loading custom snippets")
      print("Error loading custom snippets:\n" .. snippets_err)
    end

    -- Load custom lsp configs
    local lsp_ok, lsp_err = pcall(require, "user.lsp")
    if not lsp_ok then
      print("Error loading custom lsp settings")
      print("Error loading custom lsp settings:\n" .. lsp_err)
    end

    -- Load custom gui configs
    local gui_ok, gui_err = pcall(require, "user.gui")
    if not gui_ok then
      print("Error loading custom lsp settings:\n" .. gui_err)
    end

    -- Load test code
    local exp_ok, exp_err = pcall(require, "user.experimentation")
    if not exp_ok then
      print("Error execution test scripts:\n" .. exp_err)
    end

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    --require'lspconfig'.zeta_note.setup{
    --  cmd = {'/home/dave/.cargo/bin/zeta-note'}
    --}
  end,
}

return config
