local whichkey = require'which-key'

return function()
  local mappings = {
    msn = { "<cmd>Mason<cr>", "open mason"}
  }

  local opts = { mode = "n", prefix = "<leader" }

  whichkey.register(mappings, opts)
end
