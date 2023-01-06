local inlayhints = require("lsp-inlayhints")
local register_keybindings = require("x.config.plugins.keybindings.lsp")
-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsps = require("x.config.plugins.mason")

-- go autoformat
--local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.go",
--  callback = function()
--    format.goimport()
--  end,
--  group = format_sync_grp,
--})

local on_attach = function(client, bufnr)
  register_keybindings(client, bufnr)
  inlayhints.on_attach(client, bufnr, false)

  --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<leader>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)

  -- disable LSP formatting
  --vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
end

-- remove rust_analyzer since we're setting it up with rust-tools
--for idx, value in ipairs(lsps) do
--  if value == "rust_analyzer" then
--    table.remove(lsps, idx)
--  end

local servers = lsps
for _, server in ipairs(servers) do
  local cfg = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if server == "sumneko_lua" then
    cfg.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
  end

  if server == "gopls" then
    cfg.cmd = { "gopls", "serve" }
    cfg.filetypes = { "go", "gomod" }
    cfg.root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git")
    cfg.settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    }
  end

  -- rust_analyzer is only working for the first buffer we attach to

  if server == "rust_analyzer" then
    cfg.settings = {
      ["rust_analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    }
  end

  require("lspconfig")[server].setup(cfg)
end

--require('rust-tools').setup({
--  server = {
--    on_attach = on_attach
--  }
--})
