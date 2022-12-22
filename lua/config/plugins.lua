return {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    {
        "rose-pine/neovim",
	name = "rose-pine",
	config = function()
            vim.cmd.colorscheme("rose-pine")
	end
    }
}
