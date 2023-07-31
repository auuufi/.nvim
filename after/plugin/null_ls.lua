local null_ls_status, null_ls = pcall(require, "null-ls")

if not null_ls_status then
    return
end

local is_available = function(utils)
    return utils.root_has_file({
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
    })
end

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d.with({
            condition = is_available,
        }),
        null_ls.builtins.code_actions.gitsigns.with({
            config = {
                filter_actions = function(title)
                    return title:lower():match("blame") == nil
                end,
            },
        }),

        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.eslint_d.with({
            condition = is_available,
        }),

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.eslint_d.with({
            condition = is_available,
        }),
        null_ls.builtins.formatting.prettierd.with({
            extra_filetypes = { "svelte" },
        }),
        null_ls.builtins.formatting.rustfmt.with({
            extra_args = function(params)
                local path = require("plenary.path")
                local cargo_toml = path:new(params.root .. "/" .. "Cargo.toml")

                if cargo_toml:exists() and cargo_toml:is_file() then
                    for _, line in ipairs(cargo_toml:readlines()) do
                        local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                        if edition then
                            return { "--edition=" .. edition }
                        end
                    end
                end

                return { "--edition=2021" }
            end,
        }),
    },
})
