local register_keys = require("x.config.plugins.keybindings.navigator")
local navigator = require("Navigator")

register_keys()

navigator.setup({
  auto_save = "current",
})
