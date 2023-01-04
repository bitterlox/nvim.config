local whichkey = require "which-key"

return function (client, bufnr)
  local mapping = {
    g = {
      name = "lsp - go to",
      df = {
        { vim.lsp.buf.type_definition, "go to definition" }
      },
      dc = {
        { vim.lsp.buf.type_declaration, "go to declaration" }
      },
      i = {
        { vim.lsp.buf.implementation, "go to implementation" }
      }
    },
    h = {
        { vim.lsp.buf.hover, "hover"}
    },
    s = {
      { vim.lsp.buf.signature_help, "signature help"}
    },
    r = {
      n = {
        { vim.lsp.buf.rename, "rename" }
      },
      r = {
        { vim.lsp.buf.references, "references" }
      }
    },
    a = {
      { vim.lsp.buf.code_action, "code action" }
    },
  }

  local opts = { mode = "n", prefix = "<leader>", buffer = bufnr}

  whichkey.register(mapping, opts)
end
