local status, tokyonight = pcall(require, "tokyonight")
if not status then
    return
end

tokyonight.setup({
    style = "night",
    styles = {
        functions = { italic = true },
        variables = { italic = true },
        sidebars = "normal",
        floats = "normal",
    },
    lualine_bold = true,
})

vim.cmd.colorscheme("tokyonight")
