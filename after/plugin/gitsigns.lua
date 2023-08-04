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

vim.keymap.set("n", "<Leader>tb", gitsigns.toggle_current_line_blame)
vim.keymap.set("n", "<Leader>td", gitsigns.toggle_deleted)
vim.keymap.set("n", "<Leader>gu", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<Leader>gd", function()
    gitsigns.diffthis("~")
end)
vim.keymap.set("v", "<Leader>gr", function()
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<Leader>gs", function()
    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
