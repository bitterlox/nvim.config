local telescope = require("x.plugins.telescope")
local treesitter = require("x.plugins.treesitter")
local themes = require("x.plugins.themes")
local tpope = require("x.plugins.tpope")
local mason = require("x.plugins.mason")
local lspconfig = require("x.plugins.lspconfig")
local nvimcmp = require("x.plugins.nvimcmp")
local neodev = require("x.plugins.neodev")
local luasnip = require("x.plugins.luasnip")
local visualstarsearch = require("x.plugins.visualstarsearch")
local null_ls = require("x.plugins.null-ls")
local inlayhints = require("x.plugins.inlay-hints")
local neotest = require("x.plugins.neotest")
local tmux = require("x.plugins.tmux")

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
  -- nvimcmp
  nvimcmp,
  -- neodev - completion sources from plugins & neovim apis
  neodev,
  -- luasnip
  luasnip,
  -- search for visually highlighted text
  visualstarsearch,
  -- null-ls
  null_ls,
  -- inlayhints
  inlayhints,
  -- neotest
  neotest,
  -- tmux - integrate with tmux
  tmux,
}
