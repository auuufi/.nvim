local status, gitsigns = pcall(require, "gitsigns")
if not status then
  return
end

gitsigns.setup({
  signs = {
    add = { text = "󰐗 " },
    change = { text = "󰻂 " },
    delete = { text = "󰍶 " },
    topdelete = { text = "󰟄 " },
    changedelete = { text = "󰟃 " },
    untracked = { text = "󰋗 " },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 50,
  },
  preview_config = {
    border = "rounded",
  },
})
