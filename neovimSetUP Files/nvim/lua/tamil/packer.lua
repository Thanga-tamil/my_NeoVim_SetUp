vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use 'preservim/nerdtree'

    use 'dense-analysis/ale'
  
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
 
  use 'windwp/nvim-autopairs'

  use {

	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
 
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use ('ThePrimeagen/harpoon')
  
  use ('mbbill/undotree')


  -- use ('tpope/vim-fugitive') -- for git

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {

		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'}

	  }
  }

 end)
 
