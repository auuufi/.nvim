local status, lualine = pcall(require, "lualine")
if not status then
    return
end

lualine.setup({
    options = {
        theme = "tokyonight",
        component_separators = "󰇘",
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = { statusline = 50 },
        padding = 2,
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = "" } },
        },
        lualine_b = {
            "branch",
            { "diff", symbols = { added = "󰐗 ", modified = "󰻂 ", removed = "󰍶 " } },
            {
                "diagnostics",
                symbols = { error = "󰅙 ", warn = "󱇎 ", info = "󰋼 ", hint = "󰀨 " },
                update_in_insert = true,
            },
        },
        lualine_c = {
            { "filename", symbols = { modified = "󰛿 ", readonly = "󰮔 " } },
        },
        lualine_x = {
            "filetype",
            "filesize",
            { "fileformat", symbols = { unix = "" } },
            "encoding",
        },
        lualine_y = { "progress" },
        lualine_z = {
            { "location", separator = { right = "" } },
        },
    },
})
