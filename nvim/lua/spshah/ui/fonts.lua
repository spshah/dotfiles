
-- lua/spshah/ui/fonts.lua
-- GUI font handling (Neovim-qt / Goneovim)

if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont =
    "Hack Nerd Font:h8,Hack:h9,JetBrains Mono NL Light:h14,Monospace:h10"

  -- Quick font scaling
  vim.keymap.set("n", "fu", ":set guifont=Monospace:h14<CR>", { desc = "Font Up" })
  vim.keymap.set("n", "fd", ":set guifont=Monospace:h10<CR>", { desc = "Font Down" })
end
