local oil_status, oil = pcall(require, "oil")

if not oil_status then
    return
end

oil.setup({
    columns = {
        "permissions",
        "size",
        "mtime",
    },
    win_options = {
        signcolumn = "yes",
    },
    view_options = {
        show_hidden = true,
    },
    float = {
        padding = 5,
        win_options = {
            winblend = 0,
        },
    },
})

vim.keymap.set("n", "<S-e>", oil.open)
vim.keymap.set("n", "<S-f>", oil.open_float)
