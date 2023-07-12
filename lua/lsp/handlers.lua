local M = {}

function M.setup()
    local signs = { Error = "󰅙 ", Warn = "󱇎 ", Hint = "󰀨 ", Info = "󰋼 " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local config = {
        virtual_text = {
            prefix = "󰝥 ",
        },
        update_in_insert = true,
        severity_sort = true,
    }

    vim.diagnostic.config(config)
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

function M.on_attach(client, bufnr)
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

local status, lsp = pcall(require, "cmp_nvim_lsp")
if not status then
    return
end

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = lsp.default_capabilities(client_capabilities)

return M
