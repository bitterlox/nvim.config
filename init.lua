-- setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", 
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

local plugins = require('x.plugins')

local pkgs = {}

for i = #plugins,1,-1 do
  local pkg = plugins[i]
  -- im here i can loop over pkg, and for entries that aren't a {}, turn them into {},
  -- so that we can also add a pin:true to easily pin/unpin all of the plugins
  vim.list_extend(pkgs, pkg)
end

require('lazy').setup(pkgs, {})

--

require('x.config')
