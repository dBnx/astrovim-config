return function(server, server_opts)
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
end
