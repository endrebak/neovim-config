-- Set mapleader
vim.g.mapleader = " "

-- Plugin management
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.5'}
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/cmp-nvim-lsp' 
  use 'ggandor/leap.nvim'
  use 'stevearc/oil.nvim'
  use {
        'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
  }
  use "loctvl842/monokai-pro.nvim"
  use 'nvim-treesitter/nvim-treesitter'
  use "folke/which-key.nvim"
end)


require('oil_config')
require('telescope_config')
require('leap_config')
require('lsp_config')
require('pbcopy_config')
require('monokai_config')
require('which_key_config')
require('treesitter_config')


