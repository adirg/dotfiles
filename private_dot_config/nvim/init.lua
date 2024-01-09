-- Set leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used).
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install lazy.nvim (if not already installed)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{ import = 'plugins' }})

require('options')
require('mappings')
