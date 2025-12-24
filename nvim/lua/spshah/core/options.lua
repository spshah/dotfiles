
-- lua/spshah/core/options.lua

-- Leaders (must be early)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Disable default netrw loading
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General
vim.opt.title = true
vim.opt.history = 200
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.updatetime = 100
vim.opt.undofile = true
vim.opt.encoding = "utf-8"
vim.opt.path:append("**")

-- UI
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 3
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Indentation (2 spaces)
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
