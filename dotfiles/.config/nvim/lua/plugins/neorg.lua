local function config() 
    require('neorg').setup{
        load = {
            ['core.defaults'] = {},
            ['core.concealer'] = {},
            ['core.dirman'] = {
                config = {
                    default_workspace = 'notes',
                    workspaces = {
                        notes = '~/notes'
                    }
                }
            }
        }
    }
end

return {
    'nvim-neorg/neorg',
    version = '*',
    build = ':Neorg sync-parsers',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    --config = function() require('plugins/neorg') end
    config = config
}
