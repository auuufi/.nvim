local tokyonight_status, tokyonight = pcall(require, "tokyonight")

if not tokyonight_status then
    return
end

tokyonight.setup({
    style = "moon",
    styles = {
        sidebars = "normal",
        floats = "normal",
    },
    lualine_bold = true,
})

vim.cmd.colorscheme("tokyonight")
