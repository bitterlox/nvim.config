-- mason - install LSPs, DAPs, Linters, Formatters
-- mason-lspconfig - mason < - > nvim-lspconfig
-- nvim-lspconfig - configure LSPs
return {
    -- todo: split out mason into its own file
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
    {
    "neovim/nvim-lspconfig",
    lazy = false,
    },
}
