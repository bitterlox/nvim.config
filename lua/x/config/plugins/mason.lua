require("mason").setup()

local lsps = require('x.consts.lsps')

require("mason-lspconfig").setup({
    ensure_installed = lsps
})

