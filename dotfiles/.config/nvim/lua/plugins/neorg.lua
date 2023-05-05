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
