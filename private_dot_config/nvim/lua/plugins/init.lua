return {
    -- Colorscheme
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard"
            })
            vim.cmd.colorscheme 'gruvbox'
        end
    },

    -- Status line
    'nvim-lualine/lualine.nvim',

    -- Navigate seamlessly between vim and tmux splits
    'christoomey/vim-tmux-navigator',

    -- Git integration
    'tpope/vim-fugitive',
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    },

    -- Easily delete, change and add surroundings
    'tpope/vim-surround',

    -- Automatically adjust 'shiftwidth' and 'expandtab' heuristically
    'tpope/vim-sleuth',

    -- Easily comment / uncomment code
    'scrooloose/nerdcommenter',

    -- File system explorer
    'scrooloose/nerdtree',
}
