local nls = require("null-ls")
local register_keys = require("x.config.plugins.keybindings.null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

register_keys()

nls.setup({
  sources = {
    nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    --    nls.builtins.diagnostics.eslint_d,
    --    nls.builtins.formatting.prettier.with({
    --      extra_args = { "--single-quote", "false" },
    --    }),
    nls.builtins.formatting.prettier,
    nls.builtins.formatting.shellharden,
    nls.builtins.diagnostics.jsonlint,
    nls.builtins.diagnostics.eslint_d,
    nls.builtins.diagnostics.tsc,
    nls.builtins.diagnostics.shellcheck,
    nls.builtins.code_actions.shellcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use  instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
