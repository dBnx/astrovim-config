return function(client, bufnr)
  -- Disable formatter for lsp's:
  --if client.name == "tsserver" or client.name == "html" then
  --  client.server_capabilities.documentFormattingProvider = false
  --end
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      pattern = "<buffer>",
      callback = vim.lsp.buf.formatting_sync,
    })
  end

  if client.name == "sqls" then
    require("sqls").on_attach(client, bufnr)
  end
  --if client.name == "rust_analyzer" then
  --  vim.cmd [[ autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}} ]]
  --end
end
