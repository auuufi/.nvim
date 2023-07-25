local M = {}

M.setup = function()
    vim.diagnostic.config({
        virtual_text = {
            prefix = "~",
        },
        signs = false,
        update_in_insert = true,
        severity_sort = true,
    })
end

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local lsp_organize_imports = function(bufnr)
    vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(bufnr) },
    }, 50)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
                lsp_organize_imports(bufnr)
            end,
        })
    end
end

local lsp_status, lsp = pcall(require, "cmp_nvim_lsp")

if not lsp_status then
    return
end

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = lsp.default_capabilities(client_capabilities)

return M
