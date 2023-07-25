local lspsaga_status, lspsaga = pcall(require, "lspsaga")

if not lspsaga_status then
    return
end

lspsaga.setup({
    ui = {
        border = "rounded",
        title = false,
        code_action = "~",
    },
    lightbulb = {
        sign = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
})

vim.keymap.set({ "n", "t" }, "<S-t>", "<Cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "gf", "<Cmd>Lspsaga finder<CR>")
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>")
vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>")
vim.keymap.set("n", "<Leader>a", "<Cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "<Leader>d", "<Cmd>Lspsaga show_workspace_diagnostics<CR>")
vim.keymap.set("n", "<Leader>o", "<Cmd>Lspsaga outline<CR>")
