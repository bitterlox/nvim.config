-- mason - install LSPs, DAPs, Linters, Formatters
-- mason-lspconfig - mason < - > nvim-lspconfig
-- ------------------------------------
-- MUST BE LOADED BEFORE nvim-lspconfig
return {
    {
    "williamboman/mason.nvim",
    lazy = false,
    config = function ()
            require("mason").setup()
    end
    },
    {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function ()
        require("mason-lspconfig").setup({
            ensure_pkgs = { "sumneko_lua", "rust_analyzer", "gopls", "tsserver" }
	})
    end
    },
}
