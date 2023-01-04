local register_keybindings = require("x.config.plugins.keybindings.mason")

require("mason").setup()

local lsps = {
  "sumneko_lua",
  "rust_analyzer",
  "gopls",
  "tsserver",
  "bashls",
  "html",
  "cssls",
  "cssmodules_ls",
}
--local linters = { "stylua", "goimports", "gofumpt", "shellcheck" }

local ensure_installed = {}

vim.list_extend(ensure_installed, lsps)

require("mason-lspconfig").setup({
  ensure_installed = lsps,
})

register_keybindings()

return lsps
