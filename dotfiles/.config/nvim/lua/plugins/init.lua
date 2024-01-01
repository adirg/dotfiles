local config = function(plugin)
    return string.format("require('plugins/%s')", plugin)
end

return require('packer').startup(function(use)

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use{'ellisonleao/gruvbox.nvim',
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end
    }

    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- Navigate seamlessly between vim and tmux splits
    use 'christoomey/vim-tmux-navigator'

    -- Git integration
    use 'tpope/vim-fugitive'
    use{
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    -- Easily delete, change and add surroundings
    use 'tpope/vim-surround'

    -- Automatically adjust 'shiftwidth' and 'expandtab' heuristically
    use 'tpope/vim-sleuth'

    -- Auto-pairs
    use{
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    -- Easily comment / uncomment code
    use 'scrooloose/nerdcommenter'

    -- File system explorer
    use 'scrooloose/nerdtree'

    -- Completion: engine & plugins
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use{
        'hrsh7th/nvim-cmp',
        config = config('cmp')
    }

    -- LSP configuration
    use{
        'neovim/nvim-lspconfig',
        config = config('lsp')
    }

    -- Language syntax parser
    use{
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = config('treesitter')
    }

    -- Additional text objects via nvim-treesitter
    use{
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter'
    }

    -- Debugger
    use{
        'rcarriga/nvim-dap-ui',
        requires = 'mfussenegger/nvim-dap',
        config = config('dap')
    }

    -- TODO: probably should be installed outside neovim
    use{'junegunn/fzf', run = './install --all'}

    -- Extendable fuzzy finder
    use{
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = 'nvim-lua/plenary.nvim',
        config = config('telescope'),
    }
    use{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Note taking
    use{
        'nvim-neorg/neorg',
        tag = '*',
        run = ':Neorg sync-parsers',
        requires = 'nvim-lua/plenary.nvim',
        config = config('neorg'),
    }

end)

