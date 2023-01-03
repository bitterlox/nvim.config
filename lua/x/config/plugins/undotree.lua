local whichkey = require "which-key"

whichkey.register({
{
  u = {
    name = "undotree",
    { "<cmd>UndotreeToggle<cr>", "open undotree" }
  }
},
{ mode = "n", prefix = "<leader>" },
})

