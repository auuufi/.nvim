local status, _ = pcall(require, "lspconfig")
if not status then
  return
end

require("lsp.handlers").setup()
