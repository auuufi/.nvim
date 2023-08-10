local tabnine_status, tabnine = pcall(require, "tabnine")

if not tabnine_status then
    return
end

tabnine.setup({
    disable_auto_comment = true,
    accept_keymap = "<CR>",
    debounce_ms = 50,
})
