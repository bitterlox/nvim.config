-- leader mappings
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("n", "<leader>nrw", vim.cmd.Ex)

-- Lazy quick open
vim.keymap.set("n", "<leader>lzy", vim.cmd.Lazy)

-- Mason quick open
vim.keymap.set("n", "<leader>msn", vim.cmd.Mason)

-- move visually highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
