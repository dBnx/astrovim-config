--if server.name == "rust_analyzer" then
--  local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension/"
--  local codelldb_path = extension_path .. "adapter/codelldb"
--  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
--
--  require("rust-tools").setup {
--    server = server_opts,
--    dap = {
--      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
--    },
--  }
--  vim.cmd [[ autocmd CursorMoved,InsertLeave,BufEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = '\t» ', highlight = "Comment", aligned = false, enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]
--else
--  --server:setup(server_opts)
--end

return {
  settings = {

    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      -- enable clippy diagnostics on save
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--no-deps" },
      },
      inlayHints = {
        enable = true,
        maxLength = 25,

        -- { enabled = true }
        bindingModeHints = true,
        chainingHints = true,
        closingBraceHints = true,
        -- { enabled = true, useParameterNames = false }
        lifetimeElisionHints = false,
        --rust-analyzer.inlayHints.typeHints.enable (default: true)
        --    Whether to show inlay type hints for variables.
        --rust-analyzer.inlayHints.typeHints.hideClosureInitialization (default: false)
        --    Whether to hide inlay type hints for let statements that initialize to a closure. Only applies to closures with blocks, same as rust-analyzer.inlayHints.closureReturnTypeHints.enable.
        --rust-analyzer.inlayHints.typeHints.hideNamedConstructor (default: false)
        --    Whether to hide inlay type hints for constructors.
        typeHints = true,
      },
      --rust-analyzer.inlayHints.closingBraceHints.minLines (default: 25)
      --    Minimum number of lines required before the } until the hint is shown (set to 0 or 1 to always show them).
      --rust-analyzer.inlayHints.closureReturnTypeHints.enable (default: "never")
      --    Whether to show inlay type hints for return types of closures.
      --rust-analyzer.inlayHints.parameterHints.enable (default: true)
      --    Whether to show function parameter name inlay hints at the call site.
      --rust-analyzer.inlayHints.reborrowHints.enable (default: "never")
      --    Whether to show inlay type hints for compiler inserted reborrows.
      --rust-analyzer.inlayHints.renderColons (default: true)
      --    Whether to render leading colons for type hints, and trailing colons for parameter hints.
    },

    rust_analyzer = {
      inlayHints = {
        enable = true,
        renderColons = true,
        chainingHints = true,
        maxLength = 25,
        parameterHints = true,
        typeHints = true,
        hideNamedConstructorHints = false,
      },
      check_on_save = {
        enable = true,
      },
    },
  },
}
