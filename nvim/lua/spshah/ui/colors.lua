
-- lua/spshah/ui/colors.lua

vim.cmd("syntax enable")
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.colorcolumn = "80,120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#cc0000" })

-- Fallback colorscheme logic
for _, cs in ipairs({ "molokai", "nord", "evening", "desert" }) do
  if pcall(vim.cmd.colorscheme, cs) then
    break
  end
end
