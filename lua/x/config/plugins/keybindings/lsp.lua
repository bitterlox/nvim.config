return function(client, bufnr)
  local bufopts = { remap = false, buffer = bufnr }

  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "dn", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gdc", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "H", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<leader>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
end
