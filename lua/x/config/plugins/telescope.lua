local builtin = require('telescope.builtin')
local whichkey = require "which-key"

whichkey.register({
{
  t = {
    name = "telescope",
    p = {
      { builtin.find_files , "find project files" }
    },
    gi = {
      { builtin.git_files , "find git files" }
    },
    gr = {
      {
        function()
          builtin.grep_string({ search = vim.fn.input("Grep > ")});
        end ,
        "find in file"
      }
    }
  }
},
{ prefix = "<leader>" },
})

--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
