local function config()
    local cmp = require('cmp')

    vim.opt.completeopt = 'menu,menuone,noselect'

    cmp.setup{
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = string.format('%s', vim_item.kind)
                vim_item.menu = ({
                    buffer = '[Buffer]',
                    nvim_lsp = '[LSP]',
                })[entry.source.name]
                return vim_item
            end,
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'luasnip' },
            { name = 'path' },
        }, {
                { name = 'buffer', keyword_length = 3 },
            }),
    }
end

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Snippet engine
        -- TODO: do we need to install nvim-cmp source for LuaSnip?
        'L3MON4D3/LuaSnip',
        -- Source for neovim builtin LSP client
        'hrsh7th/cmp-nvim-lsp',
        -- Source for displaying function signatures
        'hrsh7th/cmp-nvim-lsp-signature-help',
        -- Source for buffer words
        'hrsh7th/cmp-buffer',
        -- Source for filesystem paths
        'hrsh7th/cmp-path',
    },
    config = config
}
