local register_keybindings = require'x.config.plugins.keybindings.mason'

require("mason").setup()

local lsps = require('x.consts.lsps')

require("mason-lspconfig").setup({
    ensure_installed = lsps
})

register_keybindings()
