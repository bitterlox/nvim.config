local builtin = require("telescope.builtin")

return function()
  vim.keymap.set("n", "<leader>pf", builtin.find_files)
  vim.keymap.set("n", "<leader>gf", builtin.git_files)
  vim.keymap.set("n", "<leader>gr", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
  end)
end

--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
