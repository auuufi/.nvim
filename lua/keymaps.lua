vim.keymap.set("n", "<C-i>2", function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
end)
vim.keymap.set("n", "<C-i>4", function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
end)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
