return function()
  vim.keymap.set({ "n", "t" }, "<C-h>", vim.cmd.NavigatorLeft)
  vim.keymap.set({ "n", "t" }, "<C-l>", vim.cmd.NavigatorRight)
  vim.keymap.set({ "n", "t" }, "<C-k>", vim.cmd.NavigatorRight)
  vim.keymap.set({ "n", "t" }, "<C-j>", vim.cmd.NavigatorDown)
  vim.keymap.set({ "n", "t" }, "<C-p>", vim.cmd.NavigatorPrevious)
end
