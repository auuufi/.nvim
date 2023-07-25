local gitsigns_status, gitsigns = pcall(require, "gitsigns")

if not gitsigns_status then
    return
end

gitsigns.setup({
    current_line_blame_opts = {
        delay = 50,
    },
    preview_config = {
        border = "rounded",
    },
})

vim.keymap.set("v", "<Leader>hr", function()
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<Leader>hs", function()
    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("n", "<Leader>hd", function()
    gitsigns.diffthis("~")
end)
vim.keymap.set("n", "<Leader>tb", gitsigns.toggle_current_line_blame)
vim.keymap.set("n", "<Leader>td", gitsigns.toggle_deleted)
vim.keymap.set("n", "<Leader>hR", gitsigns.reset_buffer)
vim.keymap.set("n", "<Leader>hS", gitsigns.stage_buffer)
vim.keymap.set("n", "<Leader>hp", gitsigns.preview_hunk)
vim.keymap.set("n", "<Leader>hr", gitsigns.reset_hunk)
vim.keymap.set("n", "<Leader>hs", gitsigns.stage_hunk)
vim.keymap.set({ "n", "v" }, "<Leader>hu", gitsigns.undo_stage_hunk)
