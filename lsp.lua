return {
  skip_setup = { "clangd", "rust_analyzer" },
  -- enable servers that you already have installed without mason
  servers = {
    -- "pyright"
  },
  formatting = {
    -- control auto formatting on save
    format_on_save = {
      enabled = true, -- enable or disable format on save globally
      ignore_filetypes = { -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
      -- "sumneko_lua",
    },
    timeout_ms = 1000, -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  -- easily add or disable built in mappings added during LSP attaching
  mappings = {
    n = {
      -- ["<leader>lf"] = false -- disable formatting keymap
    },
  },
  -- add to the global LSP on_attach function
  -- on_attach = function(client, bufnr)
  -- end,

  -- override the mason server-registration function
  -- server_registration = function(server, opts)
  --   require("lspconfig")[server].setup(opts)
  -- end,

  -- Add overrides for LSP server settings, the keys are the name of the server
  ["server-settings"] = {
    -- example for addings schemas to yamlls
    -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
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
    texlab = require 'user.lsp-server-settings.texlab',
    clangd = {
      capabilities = {
        offsetEncoding = "utf-8",
      },
    },
  },
}
