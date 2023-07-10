local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns.with({
      config = {
        filter_actions = function(title)
          return title:lower():match("blame") == nil
        end,
      },
    }),
  },
})
