-- Set up lspconfig.
local lsps = require "x.consts.lsps"
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function (client, bufnr)


  local bufopts = { remap=false, buffer=bufnr }

  -- configuring diagnostic stuff --
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization --

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

  -- enable diagnostic hover window --
  vim.o.updatetime = 250
  vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  --

  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n',']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gdc', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--vim.keymap.set('n', '<leader>wl', function()
--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--end, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, bufopts)
--vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)



end

local servers = lsps
for _, server in ipairs(servers) do
	local cfg = {
            capabilities = capabilities,
	    on_attach = on_attach
        }

        if server == "sumneko_lua" then
        cfg.settings = {
		  Lua = {
		      runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT',
		      },
		      diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = {'vim'},
		      },
		      workspace = {
			-- Make the server aware of Neovim runtime files
			library = vim.api.nvim_get_runtime_file("", true),
			checkThirdParty = false,
		      },
		      -- Do not send telemetry data containing a randomized but unique identifier
		      telemetry = {
			enable = false,
		      },
		    },
        }
        end

        require('lspconfig')[server].setup(cfg)
end
