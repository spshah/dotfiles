
-- lua/spshah/plugins/ui.lua
-- Statusline + keybinding discoverability

return {
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "onedark",
        section_separators = "",
        component_separators = "|",
        icons_enabled = true,
      },
    },
  },

  -- Which-key (leader key hints)
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      delay = 0,
      spec = {
        { "<leader>f", group = "[F]ile" },
        { "<leader>b", group = "[B]uffer" },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>g", group = "[G]it" },
      },
    },
  },
  {
    "UtkarshVerma/molokai.nvim",
  }
}
