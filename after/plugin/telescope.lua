local telescope_status, telescope = pcall(require, "telescope")

if not telescope_status then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Esc>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
    extensions = {
        file_browser = {
            initial_mode = "normal",
            previewer = false,
            path = "%:p:h",
            grouped = true,
            hidden = true,
            prompt_path = true,
            dir_icon = ".",
            hijack_netrw = true,
        },
    },
})

telescope.load_extension("file_browser")

vim.keymap.set("n", "<S-e>", telescope.extensions.file_browser.file_browser)
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
