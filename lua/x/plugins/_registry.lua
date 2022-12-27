local telescope = require "x.plugins.telescope"
local treesitter = require "x.plugins.treesitter"
local themes = require "x.plugins.themes"
local fugitive = require "x.plugins.fugitive"
local mason = require "x.plugins.mason"
local lspconfig = require "x.plugins.lspconfig"
local nvimcmp = require "x.plugins.nvimcmp"
local luasnip = require "x.plugins.luasnip"


return {
    -- fuzzy finder
    telescope,
    -- ast
    treesitter,
    -- themes
    themes,
    -- git client
    fugitive,
    -- addons manager
    mason,
    -- lsp-config
    lspconfig,
    -- nvimcmp
    nvimcmp,
    -- luasnip
    luasnip,
}
