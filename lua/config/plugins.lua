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
}
