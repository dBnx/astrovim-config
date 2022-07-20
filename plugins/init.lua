return {
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

  { "mfussenegger/nvim-dap" },
  ["neovim/nvim-lspconfig"] = {
    config = function() require "lspconfig" end,
  },

  -- { "nvim-lua/plenary.nvim" },

  ["simrat39/rust-tools.nvim"] = {
    requires = { "nvim-lspconfig", "nvim-dap" },
    config = function()
      --require("nvim-lspconfig").rust_analyzer.setup {}
      require("rust-tools").setup(require "user.plugins.rust_tools")
      -- set inlay hints
      require("rust-tools.inlay_hints").set_inlay_hints()
    end,
    -- Is configured via the server_registration_override installed below!
  },

  ["nvim-telescope/telescope-ui-select.nvim"] = {
    requires = "telescope.nvim",
    config = function() require("telescope").load_extension "ui-select" end,
  },

  ["chrisbra/csv.vim"] = {
    config = function() end,
  },

  { "elkowar/yuck.vim" },

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
}
