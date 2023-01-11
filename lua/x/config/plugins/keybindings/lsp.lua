local builtin = require("telescope.builtin")
return function(client, bufnr)
  local bufopts = { remap = false, buffer = bufnr }

  --vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "dn", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

  vim.keymap.set("n", "gdc", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "H", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<leader>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)

  -- supercharging with telescope
  vim.keymap.set("n", "<leader>d", builtin.diagnostics, bufopts)

  -- there's also incoming calls and outgoing calls if i like that
  vim.keymap.set("n", "<leader>rr", builtin.lsp_references, bufopts)
  vim.keymap.set("n", "<leader>ic", builtin.lsp_incoming_calls, bufopts)
  vim.keymap.set("n", "<leader>oc", builtin.lsp_outgoing_calls, bufopts)
  vim.keymap.set("n", "gd", builtin.lsp_definitions, bufopts)
  vim.keymap.set("n", "gtd", builtin.lsp_type_definitions, bufopts)
  vim.keymap.set("n", "gi", builtin.lsp_implementations, bufopts)
end
