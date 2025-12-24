
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local b = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", b.find_files)
    vim.keymap.set("n", "<leader>sg", b.live_grep)
  end,
}
