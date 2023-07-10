local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
  return
end

local util = require("packer.util")

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("nvim-tree/nvim-web-devicons")
    use("nvim-lua/plenary.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-telescope/telescope.nvim")
    use("folke/tokyonight.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    })
    use("nvim-treesitter/playground")
    use("glepnir/lspsaga.nvim")
    use("RRethy/vim-illuminate")
    use("lewis6991/gitsigns.nvim")
    use("numToStr/Comment.nvim")

    -- LSP support
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Autocompletion
    use("hrsh7th/nvim-cmp")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("windwp/nvim-autopairs")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return util.float({ border = "rounded" })
      end,
    },
  },
})
