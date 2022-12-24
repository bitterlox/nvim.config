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

local toinstall = {}

for i = #plugins,1,-1 do
  local pkgs = plugins[i]
  local validatedpkgs = {}
  -- im here i can loop over pkg, and for entries that aren't a {}, turn them into {},
  -- so that we can also add a pin:true to easily pin/unpin all of the plugins
  for j = #pkgs,1, -1 do
	local pkg = pkgs[j]
  	if type(pkg) ~= "table" then
  		validatedpkgs[j] = {pkg}
  	else
		validatedpkgs[j] = pkg
	end
	-- can modify plugin tables en-masse
	validatedpkgs[j].pin = true
  end

  vim.list_extend(toinstall, validatedpkgs)
end

require('lazy').setup(toinstall, {})

--

require('x.config')
