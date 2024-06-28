local function config()
    -- Draw a border around lsp windows
    require('lspconfig.ui.windows').default_options.border = 'single'

    -- Use LspAttach autocommand to only map the following keys after the server attaches to the
    -- current buffer.
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <C-x><C-o>
            vim.bo[ev.buf].omnifunc =  'v:lua.vim.lsp.omnifunc'

            -- Mappings
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Also via C-] (jump to tag)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)

            -- TODO: replace <space> with <leader>?
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            -- TODO: this mapping collides with NERDCommenter (can we drop NERDCommenter when
            -- upgrading to nvim 0.10?)
            vim.keymap.set('n', '<space><space>a', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<space>gq', function() vim.lsp.buf.format{ async = true} end,
                bufopts)
        end,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspcfg = require('lspconfig')

    lspcfg.clangd.setup({
        capabilities = capabilities,
    })

    lspcfg.rust_analyzer.setup({
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

    lspcfg.lua_ls.setup({
        capabilities = capabilities,
        on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path..'/.luarc.json') and not
                vim.loop.fs_stat(path..'/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    }
                })

                client.notify("workspace/didChangeConfiguration", { settings =
                    client.config.settings })
            end
            return true
        end
    })

    lspcfg.pylsp.setup({
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
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Needed for default capabilities
        'hrsh7th/cmp-nvim-lsp',
    },

    config = config
}
