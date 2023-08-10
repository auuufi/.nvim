local cmp_status, cmp = pcall(require, "cmp")
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
local luasnip_status, luasnip = pcall(require, "luasnip")

if not cmp_status and not autopairs_status and not luasnip_status then
    return
end

local completion_cmp = require("nvim-autopairs.completion.cmp")
local from_vscode = require("luasnip.loaders.from_vscode")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "path" },
        { name = "cmdline" },
    }),
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer" },
    }),
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
        {
            name = "cmdline",
            option = {
                ignore_cmds = {},
            },
        },
    }),
})

autopairs.setup({ check_ts = true })
cmp.event:on("confirm_done", completion_cmp.on_confirm_done())
from_vscode.lazy_load()
