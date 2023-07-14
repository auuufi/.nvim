vim.o.guifont = "Iosevka:h22"
vim.g.neovide_padding_top = 5
vim.g.neovide_padding_bottom = 5
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10
vim.g.neovide_hide_mouse_when_typing = true

local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
end)
vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.10)
end)
vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.10)
end)
