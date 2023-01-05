local go = require("go")
local format = require("go.format")

go.setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    format.goimport()
  end,
  group = format_sync_grp,
})
