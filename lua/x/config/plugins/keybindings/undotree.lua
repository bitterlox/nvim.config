local whichkey = require "which-key"

return function ()
  local mapping = {
    u = {
      name = "undotree",
      { "<cmd>UndotreeToggle<cr>", "open undotree" }
    }
  }

  local opts = { mode = "n", prefix = "<leader>" }

  whichkey.register(mapping, opts)

end
