local builtin = require('telescope.builtin')
local whichkey = require "which-key"

return function ()
  local mapping = {
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
  }

  local opts = { prefix = "<leader>" }

  whichkey.register(mapping,opts)

end

--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
