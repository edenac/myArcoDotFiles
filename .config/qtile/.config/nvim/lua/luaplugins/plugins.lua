local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
 
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  require("toggleterm").setup()
  end}
  use 'rcarriga/nvim-notify'
  -- use 'mfussenegger/nvim-jdtls'
  -- use { 'kabouzeid/nvim-lspinstall', requires = 'neovim/nvim-lspconfig' }
  -- use { 'mfussenegger/nvim-dap' }
  -- use 'neovim/nvim-lspconfig'
  use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim"
      }
    }


  -- use { "mfussenegger/nvim-jdtls", ft = { "java" }}

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
