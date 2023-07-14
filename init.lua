require("lsp")
require("keymaps")
require("options")
require("plugins")

if vim.g.neovide then
    require("neovide")
end

local function highlight_yanked_text()
    vim.highlight.on_yank({
        timeout = 50,
    })
end

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = highlight_yanked_text,
})
