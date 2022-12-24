local fuzzyfinder = require "x.plugins.fuzzyfinder"
local ast = require "x.plugins.ast"
local themes = require "x.plugins.themes"
local git = require "x.plugins.git"
local addonsmanager = require "x.plugins.addonsmanager"
local lsp = require "x.plugins.lsp"
local autocompletion = require "x.plugins.autocompletion"
local snippets = require "x.plugins.snippets"


return {
    fuzzyfinder,
    ast,
    themes,
    git,
    addonsmanager,
    lsp,
    autocompletion,
    snippets,
}
