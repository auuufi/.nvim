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

-- Navigate buffers
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>")

-- Explore directory of current file
vim.keymap.set("n", "<S-e>", "<Cmd>Explore<CR>")

-- Telescope command
local status, builtin = pcall(require, "telescope.builtin")
if not status then
  return
end

vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.keymap.set("n", "fs", builtin.spell_suggest, {})
vim.keymap.set("n", "ft", builtin.filetypes, {})
vim.keymap.set("n", "<Leader>b", builtin.git_branches, {})
vim.keymap.set("n", "<Leader>c", builtin.git_commits, {})
vim.keymap.set("n", "<Leader>s", builtin.git_status, {})

-- Lspsaga command
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
vim.keymap.set("n", "<Leader>td", "<Cmd>Gitsigns toggle_deleted<CR>")
vim.keymap.set("n", "<Leader>hd", "<Cmd>Gitsigns diffthis<CR>")
vim.keymap.set("n", "<Leader>hp", "<Cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<Leader>hr", "<Cmd>Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<Leader>hs", "<Cmd>Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<Leader>hu", "<Cmd>Gitsigns undo_stage_hunk<CR>")
