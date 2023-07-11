local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

configs.setup({
    ensure_installed = {
        "bash",
        "css",
        "diff",
        "gitignore",
        "html",
        "ini",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "rust",
        "scss",
        "svelte",
        "toml",
        "tsx",
        "typescript",
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
