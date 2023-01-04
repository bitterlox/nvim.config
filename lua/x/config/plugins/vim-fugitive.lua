local whichkey = require "which-key"

local mapping = {
  g = {
    s = {
      { "<cmd>Git<cr>", "open fugitive" }
    }
  }
}

local opts = { mode = "n", prefix = "<leader>" }

whichkey.register(mapping,opts)

