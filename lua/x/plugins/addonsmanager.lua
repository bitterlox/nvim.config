-- mason - install LSPs, DAPs, Linters, Formatters
-- mason-lspconfig - mason < - > nvim-lspconfig
-- ------------------------------------
-- MUST BE LOADED BEFORE nvim-lspconfig



return {
    {
    "williamboman/mason.nvim",
    lazy = false,
    },
    {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    },
}
