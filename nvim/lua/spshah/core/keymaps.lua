
-- lua/spshah/core/keymaps.lua

local k = vim.keymap.set

-- Insert ergonomics
k("i", "jk", "<Esc>", { desc = "Fast escape" })
k("i", "<C-a>", "<Esc>^i")
k("i", "<C-e>", "<Esc>$i")

-- Save / Quit
k({ "n", "v" }, "<leader>w", "<cmd>w!<cr>")
k({ "n", "v" }, "<leader>q", "<cmd>q<cr>")

-- Window navigation
k("n", "<C-h>", "<C-w>h")
k("n", "<C-j>", "<C-w>j")
k("n", "<C-k>", "<C-w>k")
k("n", "<C-l>", "<C-w>l")

-- Buffers
k("n", "<leader>l", "<cmd>bnext<cr>")
k("n", "<leader>h", "<cmd>bprevious<cr>")
k("n", "<leader>ba", "<cmd>bufdo bd<cr>")
