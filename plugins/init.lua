return {

  -- LSP Specific Plugins -----------------------------------------------------
  {
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      require("rust-tools").setup {
        --server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
        require "user.plugins.rust_tools",
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
        extensions = require "user.lsp.server-settings.clangd_extensions",
      }
    end,
  },

  -- Debugging
  --  {
  --    "puremourning/vimspector",
  --    config = function()
  --      vim.cmd [[
  --let g:vimspector_sidebar_width = 85
  --let g:vimspector_bottombar_height = 15
  --let g:vimspector_terminal_maxwidth = 70
  --]]
  --      vim.cmd [[
  --nmap <F9> <cmd>call vimspector#Launch()<cr>
  --nmap <F5> <cmd>call vimspector#StepOver()<cr>
  --nmap <F8> <cmd>call vimspector#Reset()<cr>
  --nmap <F11> <cmd>call vimspector#StepOver()<cr>")
  --nmap <F12> <cmd>call vimspector#StepOut()<cr>")
  --nmap <F10> <cmd>call vimspector#StepInto()<cr>")
  --]]
  --      map("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
  --      map("n", "Dw", ":call vimspector#AddWatch()<cr>")
  --      map("n", "De", ":call vimspector#Evaluate()<cr>")
  --    end,
  --  },

  -- Annotation generator
  ["danymat/neogen"] = {
    module = "neogen",
    cmd = "Neogen",
    config = function() require("neogen").setup(require "user.plugins.neogen") end,
    requires = "nvim-treesitter/nvim-treesitter",
  },

  -- Markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    run = function() vim.fn["mkdp#util#install"](0) end,
    ft = {
      "markdown",
    },
  },

  -- Reopen files at last edit position
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = function() require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace") end,
  },

  ["hrsh7th/cmp-emoji"] = {
    after = "nvim-cmp",
    config = function() astronvim.add_user_cmp_source "emoji" end,
  },

  ["nanotee/sqls.nvim"] = { module = "sqls" },

  ["benfowler/telescope-luasnip.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.luasnip",
    config = function() require("telescope").load_extension "luasnip" end,
  },

  ["klen/nvim-test"] = {
    cmd = {
      "TestSuite",
      "TestFile",
      "TestNearest",
      "TestLast",
      "TestVisit",
      "TestEdit",
    },
    config = function() require("nvim-test").setup(require "user.plugins.nvim-test") end,
  },

  ["akinsho/git-conflict.nvim"] = {
    config = function() require("git-conflict").setup(require "user.plugins.git-conflict") end,
  },

  ["dstein64/vim-startuptime"] = {},

  ["zegervdv/nrpattern.nvim"] = {
    config = function() require("nrpattern").setup(require "user.plugins.nrpattern") end,
  },

  ["mvllow/modes.nvim"] = {
    config = function()
      vim.opt.cursorline = true
      require("modes").setup {
        set_cursor = true,
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    after = "rust-tools.nvim",
    config = function()
      local dap = require "dap"
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function() return "/usr/bin/python" end,
        },
      }

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "/usr/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.rust = {
        {
          name = "Rust debug",
          type = "codelldb",
          request = "launch",
          program = function()
            vim.fn.jobstart "cargo build"
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          showDisassembly = "never",
        },
      }
    end,
  },
  --["neovim/nvim-lspconfig"] = {
  --  config = function() require "lspconfig" end,
  --},

  -- { "nvim-lua/plenary.nvim" },

  ["nvim-telescope/telescope-ui-select.nvim"] = {
    requires = "telescope.nvim",
    config = function() require("telescope").load_extension "ui-select" end,
  },

  ["chrisbra/csv.vim"] = {
    config = function() end,
  },

  -- Yuck filetype support
  { "elkowar/yuck.vim" },

  -- Fancy list for lsp, lint, ... stuff
  {
    "folke/trouble.nvim",
    --requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup(require "user.plugins.trouble_nvim") end,
  },

  { "rhysd/vim-grammarous" },

  --["L3MON4D3/LuaSnip"] = {
  --  config = function()
  --    require("luasnip").config.setup(require "user.plugins.luasnip")
  --    --require("luasnip.loaders.from_lua").load { paths = "/home/dave/.config/nvim/lua/user/snippets" }
  --  end,
  --},

  --["norcalli/nvim-colorizer.lua"] = {
  --  config = function()
  --    require("nvim-colorizer").setup()
  --  end,
  --},
  --
  -- use mason-lspconfig to configure LSP installations
}
