local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  sources = {
    -- Code Actions
    null_ls.builtins.code_actions.gitsigns.with({
      config = {
        filter_actions = function(title)
          return title:lower():match("blame") == nil
        end,
      },
    }),

    -- Formatting
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
    null_ls.builtins.formatting.stylua,
  },
})
