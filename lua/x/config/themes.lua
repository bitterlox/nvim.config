-- cycle these themes randomly

local darkcolorfuns = {}
local lightcolorfuns = {}

local addtheme = function(tbl, themefn)
  table.insert(tbl, themefn)
end

-- dark themes --

addtheme(darkcolorfuns, function()
  local color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  --  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end)

addtheme(darkcolorfuns, function()
  local color = color or "adwaita"
  vim.g.adwaita_darker = true
  vim.cmd.colorscheme(color)
  --  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end)

addtheme(darkcolorfuns, function()
  local color = color or "kanagawa"
  vim.cmd.colorscheme(color)
end)

addtheme(darkcolorfuns, function()
  local color = color or "minimal"
  vim.cmd.colorscheme(color)
end)

addtheme(darkcolorfuns, function()
  local color = color or "minimal-base16"
  vim.cmd.colorscheme(color)
end)

addtheme(darkcolorfuns, function()
  local color = color or "sonokai"
  vim.g.sonokai_style = "espresso"
  vim.g.sonokai_better_performance = 1
  vim.cmd.colorscheme(color)
end)

addtheme(darkcolorfuns, function()
  local color = color or "carbonfox"
  vim.cmd.colorscheme(color)
end)

-- light themes --

--addtheme(lightcolorfuns, function()
--  local color = color or "rose-pine"
--
--  vim.o.background = "light"
--
--  vim.cmd.colorscheme(color)
--end)

--addtheme(lightcolorfuns, function()
--  local color = color or "adwaita"
--
--  vim.o.background = "light"
--
--  vim.cmd.colorscheme(color)
--end)

addtheme(lightcolorfuns, function()
  local color = color or "dayfox"
  vim.cmd.colorscheme(color)
end)

addtheme(lightcolorfuns, function()
  local color = color or "dawnfox"
  vim.cmd.colorscheme(color)
end)

local datetable = os.date("*t")
local isnighttime = datetable.hour > 20

local todaystheme = nil

-- if isnighttime then
--   local idx = require("math").fmod(tonumber(datetable.day), #darkcolorfuns) + 1
--   todaystheme = darkcolorfuns[idx]
-- else
--   local idx = require("math").fmod(tonumber(datetable.day), #lightcolorfuns) + 1
--   todaystheme = lightcolorfuns[idx]
-- end
local idx = require("math").fmod(tonumber(datetable.day), #darkcolorfuns) + 1
todaystheme = darkcolorfuns[idx]

vim.cmd("set termguicolors")

todaystheme()
