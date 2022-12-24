-- cycle these themes randomly

local colorfuncs = {}

local addtheme = function (themefn)
    table.insert(colorfuncs, themefn)
end

addtheme(function ()
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end)

addtheme(function ()
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end
)

addtheme(function ()
    color = color or "minimal"
    vim.cmd.colorscheme(color)
end)

addtheme(function ()
    color = color or "minimal-base16"
    vim.cmd.colorscheme(color)
end)

addtheme(function ()
    color = color or "sonokai"
    vim.g.sonokai_style = 'espresso'
    vim.g.sonokai_better_performance = 1
    vim.cmd.colorscheme(color)
end)

local todaysthemeidx = require('math').fmod(tonumber(os.date('*t').day), #colorfuncs) + 1
local todaystheme = colorfuncs[todaysthemeidx]

todaystheme()

vim.pretty_print()
