local keymap = vim.keymap -- for conciseness

----------------------- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')


-- Editing mappings
vim.api.nvim_set_keymap('n', '<leader>w', ':w!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true })

-- Colorscheme mappings
vim.api.nvim_set_keymap('n', '<leader>csp', ':colorscheme peachpuff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>csd', ':colorscheme desert<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>csm', ':colorscheme molokai<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cse', ':colorscheme evening<CR>', { noremap = true })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
