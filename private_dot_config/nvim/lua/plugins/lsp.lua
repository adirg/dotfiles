local function config()
    -- Draw a border around lsp windows
    require('lspconfig.ui.windows').default_options.border = 'single'

    -- Use LspAttach autocommand to only map the following keys after the server attaches to the
    -- current buffer.
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <C-x><C-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Mappings
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Also via C-] (jump to tag)
            -- We are using Telescope to list LSP references
            --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)

            -- TODO: replace <space> with <leader>?
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            -- TODO: this mapping collides with NERDCommenter (can we drop NERDCommenter when
            -- upgrading to nvim 0.10?)
            vim.keymap.set('n', '<space><space>a', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<space>gq', function() vim.lsp.buf.format { async = true } end,
                bufopts)
        end,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.lsp.config('clangd', {
        capabilities = capabilities,
    })
    vim.lsp.enable('clangd')

    vim.lsp.config('rust_analyzer', {
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = true,
                    command = "clippy"
                }
            }
        }
    })
    vim.lsp.enable('rust_analyzer')

    vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { global = { 'nvim' } },
                workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = { enable = false },
            },
        },
    })
    vim.lsp.enable('lua_ls')

    vim.lsp.config('pylsp', {
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    black = { enabled = true },
                    pycodestyle = { enabled = false },
                },
            },
        },
    })
    vim.lsp.enable('pylsp')

    local orig_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or 'rounded'
        return orig_open_floating_preview(contents, syntax, opts, ...)
    end
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Needed for default capabilities
        'hrsh7th/cmp-nvim-lsp',
    },

    config = config
}
