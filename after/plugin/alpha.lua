local alpha_status, alpha = pcall(require, "alpha")

if not alpha_status then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[ _____  ___     _______      ______     ___      ___   __      ___      ___ ]],
    [[(\"   \|"  \   /"     "|    /    " \   |"  \    /"  | |" \    |"  \    /"  |]],
    [[|.\\   \    | (: ______)   // ____  \   \   \  //  /  |│  |    \   \  //   |]],
    [[|: \.   \\  |  \/    |    /  /    ) :)   \\  \/. ./   |:  |    /\\  \/.    |]],
    [[|.  \    \. |  // ___)_  (: (____/ //     \.    //    |.  |   |: \.        |]],
    [[|    \    \ | (:      "|  \        /       \\   /     /\  |\  |.  \    /:  |]],
    [[ \___|\____\)  \_______)   \"_____/         \__/     (__\_|_) |___|\__/|___|]],
}
dashboard.section.buttons.val = {
    dashboard.button("n", "New files", "<Cmd>enew <Bar> startinsert<CR>"),
    dashboard.button("f", "Find files", "<Cmd>Telescope find_files<CR>"),
    dashboard.button("s", "Settings", "<Cmd>edit $HOME/.config/nvim/<CR>"),
    dashboard.button("u", "Update plugins", "<Cmd>PackerSync<CR>"),
    dashboard.button("q", "Quit", "<Cmd>qall<CR>"),
}
dashboard.section.footer.val = function()
    local datetime = os.date("%d-%m-%Y   ~   %H:%M:%S")
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local version = vim.version()
    local nvim_version_info = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
    return datetime .. "   ~   " .. total_plugins .. " plugins" .. "   ~   " .. nvim_version_info
end

alpha.setup({
    layout = {
        { type = "padding", val = 4 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
    },
})

vim.keymap.set("n", "<A-a>", "<Cmd>Alpha<CR>")
