local lualine_status, lualine = pcall(require, "lualine")

if not lualine_status then
    return
end

lualine.setup({
    options = {
        icons_enabled = false,
        theme = "tokyonight",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { statusline = { "alpha" } },
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diff", "filename" },
        lualine_x = { "filesize", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
