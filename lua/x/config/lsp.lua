  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local servers = { "sumneko_lua", "rust_analyzer", "gopls", "tsserver" }
  for _, lsp in ipairs(servers) do
          require('lspconfig')[lsp].setup({
              capabilities = capabilities
	  })
  end
