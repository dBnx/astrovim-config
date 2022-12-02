return {
  init = {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    -- LSP Specific Plugins -----------------------------------------------------
    {
      "simrat39/rust-tools.nvim",
      after = "mason-lspconfig.nvim",
      config = function()
        require("rust-tools").setup {
          server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
        }
        require("rust-tools").inlay_hints.enable()
      end,
    },
    {
      "saecki/crates.nvim",
      tag = "v0.2.1",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("crates").setup {
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          },
        }
      end,
    },
    {
      "p00f/clangd_extensions.nvim",
      after = "mason-lspconfig.nvim",
      config = function()
        require("clangd_extensions").setup {
          server = astronvim.lsp.server_settings "clangd",
          --extensions = require "user.lsp.server-settings.clangd_extensions",
        }
      end,
    },
    {
      "lervag/vimtex",
      config = function()
        -- This enables Vim's and neovim's syntax-related features. Without this, some
        -- VimTeX features will not work (see ":help vimtex-requirements" for more
        -- info).
        vim.cmd [[
          syntax enable
        ]]

        -- Viewer options: One may configure the viewer either by specifying a built-in
        -- viewer method:
        vim.g.vimtex_view_method = 'zathura'

        -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
        -- strongly recommended, you probably don't need to configure anything. If you
        -- want another compiler backend, you can change it as follows. The list of
        -- supported backends and further explanation is provided in the documentation,
        -- see ":help vimtex-compiler".
        vim.g.vimtex_compiler_method = 'tectonic'
        require("vimtex").setup {}
      end
    },

    -- Visual
    ["mvllow/modes.nvim"] = {
      config = function()
        vim.opt.cursorline = true
        require("modes").setup {
          set_cursor = true,
        }
      end,
    },

    -- Other plugins
    { "dstein64/vim-startuptime" },

    -- Reopen files at last edit position
    ["ethanholz/nvim-lastplace"] = {
      event = "BufRead",
      --config = function() require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace") end,
    },
    ["akinsho/git-conflict.nvim"] = {
      --config = function() require("git-conflict").setup(require "user.plugins.git-conflict") end,
    },
  },
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
  treesitter = { -- overrides `require("treesitter").setup(...)`
    -- ensure_installed = { "lua" },
  },
  -- use mason-lspconfig to configure LSP installations
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    -- ensure_installed = { "sumneko_lua" },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
    -- ensure_installed = { "prettier", "stylua" },
  },

}
