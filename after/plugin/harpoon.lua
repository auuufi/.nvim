local harpoon_status, harpoon = pcall(require, "harpoon")

if not harpoon_status then
    return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup({
    menu = {
        width = 80,
        height = 12,
    },
})

vim.keymap.set("n", "<C-a>", mark.add_file)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", ui.nav_next)
vim.keymap.set("n", "<C-p>", ui.nav_prev)

for i = 1, 5 do
    vim.keymap.set("n", tostring(i), function()
        ui.nav_file(i)
    end)
end
