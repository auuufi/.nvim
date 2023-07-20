vim.keymap.set("n", "<CR>", "<Nop>")

-- Change indentations
vim.keymap.set("n", "<C-i>2", function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
end)
vim.keymap.set("n", "<C-i>4", function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
end)

-- Navigate when in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Switching between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Explore directory of current file
vim.keymap.set("n", "<S-e>", "<Cmd>Explore<CR>")

-- Telescope command
local status, builtin = pcall(require, "telescope.builtin")
if not status then
    return
end

vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "fb", builtin.buffers)
vim.keymap.set("n", "ff", builtin.find_files)
vim.keymap.set("n", "fg", builtin.live_grep)
vim.keymap.set("n", "fh", builtin.help_tags)
vim.keymap.set("n", "fs", builtin.spell_suggest)
vim.keymap.set("n", "ft", builtin.filetypes)
vim.keymap.set("n", "<Leader>b", builtin.git_branches)
vim.keymap.set("n", "<Leader>c", builtin.git_commits)
vim.keymap.set("n", "<Leader>s", builtin.git_status)

-- Harpoon command
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-a>", mark.add_file)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", ui.nav_next)
vim.keymap.set("n", "<C-p>", ui.nav_prev)
vim.keymap.set("n", "1", function()
    ui.nav_file(1)
end)
vim.keymap.set("n", "2", function()
    ui.nav_file(2)
end)
vim.keymap.set("n", "3", function()
    ui.nav_file(3)
end)
vim.keymap.set("n", "4", function()
    ui.nav_file(4)
end)

-- Lspsaga command
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

-- Gitsigns command
local gs = require("gitsigns")

vim.keymap.set("v", "<Leader>hr", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<Leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("n", "<Leader>hD", function()
    gs.diffthis("~")
end)
vim.keymap.set("n", "<Leader>td", gs.toggle_deleted)
vim.keymap.set("n", "<Leader>hd", gs.diffthis)
vim.keymap.set("n", "<Leader>hp", gs.preview_hunk)
vim.keymap.set("n", "<Leader>hr", gs.reset_hunk)
vim.keymap.set("n", "<Leader>hs", gs.stage_hunk)
vim.keymap.set({ "n", "v" }, "<Leader>hu", gs.undo_stage_hunk)

-- Alpha command
vim.keymap.set("n", "<A-a>", "<Cmd>Alpha<CR>")
