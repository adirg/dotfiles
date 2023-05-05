vim.opt.textwidth = 100
vim.opt.colorcolumn = "+1"
vim.opt.cursorline = true

vim.opt.number = true           -- show line numbers 
vim.opt.relativenumber = true   -- enable relative line numbers
vim.opt.laststatus = 2          -- always show status line

-- Theme
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Indentation
vim.opt.expandtab = true        -- replace tab with spaces
vim.opt.tabstop = 4             -- number of spaces for tab
vim.opt.autoindent = true       -- copy indent from current line
vim.opt.shiftwidth = 4          -- number of spaces for autoindent step

-- Search
vim.opt.hlsearch = true         -- highlight search results
vim.opt.incsearch = true        -- incremental search
vim.opt.ignorecase = true       -- ignore case
vim.opt.smartcase = true        -- don't ignore case when pattern contains uppercase letters

-- Disable Backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Misc
vim.opt.wildmenu = true                 -- enhanced command line selection
vim.opt.wildignore = "*.o,*~,*.pyc"     -- ignore compiled files
