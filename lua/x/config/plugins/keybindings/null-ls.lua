local nls = require("null-ls")

return function()
  -- nep - enable prettier, see
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/SOURCES.md#enablequery
  vim.keymap.set("n", "<leader>nep", function()
    nls.enable("prettier")
    print("enabled prettier")
  end)
  -- ndp - disable prettier, see
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/SOURCES.md#enablequery
  vim.keymap.set("n", "<leader>ndp", function()
    nls.disable("prettier")
    print("disabled prettier")
  end)
end
