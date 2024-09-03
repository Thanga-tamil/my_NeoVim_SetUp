vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

return require('packer').startup(function(use)
    use 'preservim/nerdtree'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons', -- for file icons
        config = function()
            require 'nvim-tree'.setup {}
        end
    }

    use 'dense-analysis/ale'

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'windwp/nvim-autopairs'

    use {

        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use {
        "ThePrimeagen/harpoon",
        requires = { "nvim-lua/plenary.nvim" }
    }

    use('mbbill/undotree')

    --outline
    use 'simrat39/symbols-outline.nvim'

    use('tpope/vim-fugitive') -- for git

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {

            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'mfussenegger/nvim-jdtls' },
        }
    }

    require("mason").setup()
end)
