local whichkey = require "which-key"

whichkey.register({
{
  g = {
    s = {
      { "<cmd>Git<cr>", "open fugitive" }
    }
  }
},
{ mode = "n", prefix = "<leader>" },
})

