  -- Set up lspconfig.
local lsps = require "x.consts.lsps"
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = lsps
for _, server in ipairs(servers) do
	local cfg = {
            capabilities = capabilities
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
