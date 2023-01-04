local register_keybindings = require'x.config.plugins.keybindings.mason'

require("mason").setup()

local lsps = { "sumneko_lua", "rust_analyzer", "gopls", "tsserver", "bashls", "html", "cssls", "cssmodules_ls"}

require("mason-lspconfig").setup({
    ensure_installed = lsps
})

register_keybindings()

return lsps
