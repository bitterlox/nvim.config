local whichkey = require "which-key"

return function ()
  local mapping = {
    g = {
      s = {
        { "<cmd>Git<cr>", "open fugitive" }
      }
    }
  }

  local opts = { mode = "n", prefix = "<leader>" }

  whichkey.register(mapping,opts)
end
