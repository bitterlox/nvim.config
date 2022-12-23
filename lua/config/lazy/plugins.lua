-- split this up into multiple modules
-- ideally one per plugin + dependencies
-- (or one that groups all the color schemes for example)
-- and then they all get merged into one in this file
return {
    -- fuzzyfinder | telescope
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",

    -- themes
    {
        "rose-pine/neovim",
	name = "rose-pine",
    },
    "rebelot/kanagawa.nvim",
    "Yazeed1s/minimal.nvim",
    "sainnhe/sonokai",

    -- ast | treesitter + helper plugins
    {
    "nvim-treesitter/nvim-treesitter",
    config = function () 
            vim.cmd(":TSUpdate")
    end
    },
    "nvim-treesitter/playground",
    "mbbill/undotree",

    -- git client | fugitive
    "tpope/vim-fugitive",

    -- lsp integration | mason + lsp config plugins
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
            ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "tsserver" }
	})
    end
    },
    {
    "neovim/nvim-lspconfig",
    lazy = false,
    },

    -- autocompletion | nvim-cmp 
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",

    -- autocompletion | completion sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",

    -- snippets | luasnip
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets"

}
