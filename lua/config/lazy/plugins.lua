-- split this up into multiple modules
-- ideally one per plugin + dependencies
-- (or one that groups all the color schemes for example)
-- and then they all get merged into one in this file
return {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    {
        "rose-pine/neovim",
	name = "rose-pine",
    },
    "rebelot/kanagawa.nvim",
    "Yazeed1s/minimal.nvim",
    "sainnhe/sonokai",
    {
    "nvim-treesitter/nvim-treesitter",
    config = function () 
            vim.cmd(":TSUpdate")
    end
    },
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",
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
}
