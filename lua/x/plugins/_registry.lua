local telescope = require "x.plugins.telescope"
local treesitter = require "x.plugins.treesitter"
local themes = require "x.plugins.themes"
local tpope = require "x.plugins.tpope"
local mason = require "x.plugins.mason"
local lspconfig = require "x.plugins.lspconfig"
local nvimcmp = require "x.plugins.nvimcmp"
local luasnip = require "x.plugins.luasnip"
local visualstarsearch = require "x.plugins.visualstarsearch"
local rusttools = require "x.plugins.rusttools"
local whichkey = require "x.plugins.whichkey"
local null_ls = require'x.plugins.null-ls'

return {
    -- fuzzy finder
    telescope,
    -- ast
    treesitter,
    -- themes
    themes,
    -- various plugins by tpope
    tpope,
    -- addons manager
    mason,
    -- lsp-config
    lspconfig,
    -- rust tools
    rusttools,
    -- nvimcmp
    nvimcmp,
    -- luasnip
    luasnip,
    -- search for visually highlighted text
    visualstarsearch,
    -- which-key - better keymaps
    whichkey,
    -- null-ls
    null_ls,
}
