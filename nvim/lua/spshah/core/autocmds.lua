
-- lua/spshah/core/autocmds.lua

-- Track last accessed tab
vim.api.nvim_create_autocmd("TabLeave", {
  callback = function()
    vim.g.lasttab = vim.fn.tabpagenr()
  end,
})

vim.keymap.set("n", "<leader>tl", function()
  vim.cmd("tabn " .. (vim.g.lasttab or 1))
end, { desc = "Toggle last tab" })
