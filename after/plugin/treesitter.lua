local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_status then
    return
end

treesitter.setup({
    ensure_installed = {
        "c",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
    },
    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    playground = { enable = true },
    query_linter = { enable = true },
})
