local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not mason_status and not mason_lspconfig_status and not lspconfig_status then
  return
end

local servers = {
  "lua_ls",
  "rust_analyzer",
}

local opts = {
  on_attach = require("lsp.handlers").on_attach,
  capabilities = require("lsp.handlers").capabilities,
}

mason.setup({
  ui = {
    border = "rounded",
    width = 0.9,
    height = 0.7,
  },
})

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, server in pairs(servers) do
  local require, settings = pcall(require, "lsp.settings." .. server)
  if require then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  if lspconfig[server] and lspconfig[server].setup then
    lspconfig[server].setup(opts)
  end
end
