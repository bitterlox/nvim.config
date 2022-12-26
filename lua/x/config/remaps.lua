-- leader mappings
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("n", "<leader>nrw", vim.cmd.Ex)

-- Lazy quick open
vim.keymap.set("n", "<leader>lzy", vim.cmd.Lazy)

-- Mason quick open
vim.keymap.set("n", "<leader>msn", vim.cmd.Mason)

-- move visually highlighted text
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- todo: should add the equivalent for H & L mapping to < and >

-- when using J keep the cursor at the start of the line
vim.keymap.set("n", "J", "mzJ`z")

-- C_d and C_u (half page jumps) keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- when jumping to search matches, keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without losing paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

