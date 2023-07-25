require("lsp")
require("keymaps")
require("options")
require("plugins")

if vim.g.neovide then
    require("neovide")
end

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            timeout = 50,
        })
    end,
})
