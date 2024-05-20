vim.cmd("let g:netrw_liststyle = 3")

-- Neovim configuration file

local opt = vim.opt
local g = vim.g



-- General settings
opt.history = 200               -- Sets how many lines of history Neovim has to remember
opt.autoread = true             -- Set to auto read when a file is changed from the outside
opt.termguicolors = true        -- Enable true colors support
opt.clipboard = "unnamedplus"   -- Use system clipboard for copy-paste

-- Key mappings
g.mapleader = "\\"              -- With a map leader, it's possible to do extra key combinations

-- Vim user interface
opt.scrolloff = 3               -- Show N lines below or above cursor when scrolling.
opt.cursorline = true           -- Show cursor line
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.wildmenu = true             -- Turn on the Wild menu
opt.wildmode = "list:longest:full"
opt.wildignore = "*.o,*~,*.pyc,.git\\*,.hg\\*,.svn\\*,*/.git/*,*/.hg/" -- Ignore compiled files
opt.ruler = true                -- Always show current position
opt.cmdheight = 1               -- Height of the command bar
opt.hidden = true               -- A buffer becomes hidden when it is abandoned
opt.backspace = "eol,start,indent" -- Configure backspace so it acts as it should act
--opt.whichwrap:append { "<", ">", "h", "l" }
opt.ignorecase = true           -- Ignore case when searching
opt.smartcase = true            -- When searching, try to be smart about cases
opt.hlsearch = true             -- Highlight search results
opt.incsearch = true            -- Makes search act like search in modern browsers
opt.magic = true                -- For regular expressions, turn magic on
opt.showmatch = true            -- Show matching brackets when text indicator is over them
opt.mat = 2                     -- How many tenths of a second to blink when matching brackets
opt.foldcolumn = "1"              -- Add a bit extra margin to the left
opt.number = true               -- Show line numbers
opt.relativenumber =true 	-- show relative line numbers
opt.foldmethod = "syntax"       -- Fold settings
opt.foldenable = false          -- Disable folding
opt.splitright = true           -- Puts new vsplit windows to the right of the current
opt.splitbelow = true           -- Puts new split windows to the bottom of the current
opt.colorcolumn = "80"          -- Set color column to 80
opt.laststatus = 2              -- Always show the status line

-- Colors and Fonts
opt.syntax = "enable"           -- Enable syntax highlighting
opt.encoding = "utf8"           -- Set utf8 as standard encoding
opt.guifont = "JetBrains\\ Mono\\ NL\\ Light\\ 12"
opt.background = "dark"        -- Set the background tone
--opt.t_Co = "256"                  -- Set color
--vim.cmd("colorscheme molokai")      -- Set colorscheme

-- Files and backups
opt.backup = false              -- Turn backup off, since most stuff is in SVN, git etc. anyway...
opt.swapfile = false
opt.dir = "~/.cache/nvim"       -- Set directory to store swap files

-- Text, tab, and indent related
opt.shiftwidth = 4              -- Set shift width to 4 spaces.
opt.smarttab = true             -- Be smart when using tabs ;)
opt.tabstop = 4                 -- Set tab width to 4 columns.
opt.expandtab = true            -- Use space characters instead of tabs.
opt.list = true                 -- Display invisible characters
opt.listchars = "tab:»·,trail:·" -- Set listchars
opt.autoindent = true           -- Auto indent
opt.smartindent = true          -- Smart indent 
opt.wrap = true                 -- Wrap lines

-- Moving around, tabs, windows, and buffers
opt.switchbuf:append { "useopen", "usetab", "newtab" } -- Specify the behavior when switching between buffers
opt.stal = 2
--opt.iskeyword:remove("."):remove("#"):remove("-")  -- Configure iskeyword

-- Status line
opt.statusline = ""             -- Clear status line when Neovim is reloaded
--opt.statusline:append { "%F %M %Y %R", "%=" } -- Status line left side
--opt.statusline:append { "row: %l col: %c percent: %p%%" } -- Status line right side
opt.statusline =  "%F %M %Y %R", "%= row: %l col: %c percent: %p%%"  -- Status line right side
opt.laststatus = 2              -- Always show the status line

-- Helper functions
vim.fn.ClearAllHi = function()
    for i = 1, 6 do
        vim.fn.matchdelete(77750 + i)
    end
end

vim.fn.HiInterestingWord = function(n)
    vim.cmd("normal! mz")
    vim.cmd("normal! \"zyiw")
    local mid = 77750 + n
    pcall(vim.fn.matchdelete, mid)
    local pat = "\\V\\<" .. vim.fn.escape(vim.fn.getreg("z"), "\\") .. "\\>"
    vim.fn.matchadd("InterestingWord" .. n, pat, 1, mid)
    vim.cmd("normal! `z")
end


