function ColorRosePine()
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function ColorKanagawa()
    color = color or "kanagawa"
--  vim.cmd.colorscheme(color)
--  
--  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function ColorMinimal()
    color = color or "minimal"
--  vim.cmd.colorscheme(color)
--  
--  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function ColorMinimalBase16()
    color = color or "minimal-base16"
--  vim.cmd.colorscheme(color)
--  
--  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


--ColorRosePine()
