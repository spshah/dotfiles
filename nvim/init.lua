-- ~/.config/nvim/init.lua
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Core editor behavior
require("spshah.core.options")
require("spshah.core.keymaps")
require("spshah.core.autocmds")
require("spshah.core.highlights")

-- UI / Visuals
require("spshah.ui.colors")
require("spshah.ui.fonts")
require("spshah.ui.interesting")

-- netrw (lightweight fallback explorer)
require("spshah.netrw")

-- Plugin system (lazy.nvim)
require("spshah.plugins.lazy")
