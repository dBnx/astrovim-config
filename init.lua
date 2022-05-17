local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
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
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false, -- check?
      telescope = true,
      vimwiki = true,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
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
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua", "latex", "bash", "bibtex", "cpp", "python", "rust", "toml", "verilog", "vim" },
    },
    ["nvim-lsp-installer"] = { ensure_installed = { "sumneko_lua", "taplo", "texlab" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    -- Does this work?
    -- luasnip = {
    --   enable_autosnippets = true,
    -- },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    enable_autosnippets = true, -- check
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
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
  -- TODO This section
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
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
        --server:setup(server_opts)
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

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local set = vim.opt
    local g = vim.g
    g["tex_flavor"] = "latex"

    -- Wrapping
    vim.wo.wrap = true
    local map = vim.keymap.set
    map("n", "gj", "j")
    map("n", "gk", "k")
    map("n", "j", "gj")
    map("n", "k", "gk")

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
      print("Error loading custom gui settings:\n" .. gui_err)
    end

    -- Load test code
    local exp_ok, exp_err = pcall(require, "user.experimentation")
    if not exp_ok then
      print("Error execution test scripts:\n" .. exp_err)
    end

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
