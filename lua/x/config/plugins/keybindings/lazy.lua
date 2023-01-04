local whichkey = require'which-key'

return function()
  local mappings = {
    lzy = { "<cmd>Lazy<cr>", "open lazy"}
  }

  local opts = { mode = "n", prefix = "<leader" }

  whichkey.register(mappings, opts)
end
