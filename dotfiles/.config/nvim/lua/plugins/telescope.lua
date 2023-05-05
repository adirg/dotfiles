-- See `:help telescope` and `help: telescope.setup()`
require('telescope').setup{
	defaults = {
		layout_strategy = "bottom_pane",
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local telescope_builtin = require('telescope.builtin')

-- See: `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files'})
vim.keymap.set('n', '<leader>/',
	function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		telescope_builtin.current_buffer_fuzzy_find(
			require('telescope.themes').get_dropdown{ winblend = 10, previewer = false }
		)
	end,
	{ desc = '[/] Fuzzily search in current buffer' }
)

vim.keymap.set('n', '<leader> f', telescope_builtin.find_files, { desc = 'Search [f]iles' })
vim.keymap.set('n', '<leader> b', telescope_builtin.buffers, { desc = 'Search [b]uffers' })
vim.keymap.set('n', '<leader> h', telescope_builtin.help_tags, { desc = 'Search [h]elp' })
vim.keymap.set('n', '<leader> w', telescope_builtin.grep_string, { desc = 'Search current [w]ord' })
vim.keymap.set('n', '<leader> g', telescope_builtin.live_grep, { desc = 'Search by [g]rep' })
vim.keymap.set('n', '<leader> d', telescope_builtin.diagnostics, { desc = 'Search [d]iagnostics' })
