local on_attach = require("plugins.configs.lspconfig").on_attach 
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"


lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,

    }
  }
}


lspconfig.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}


lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      allFeatures = true,
    }
  }
}

lspconfig.zls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"zig"},
}
