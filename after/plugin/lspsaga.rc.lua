local status, lspsaga = pcall(require, "lspsaga")
if not status then
  return
end

lspsaga.setup({
  ui = {
    border = "rounded",
    code_action = "󰵚 ",
  },
  lightbulb = {
    virtual_text = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
})
