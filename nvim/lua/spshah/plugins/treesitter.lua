
-- lua/spshah/plugins/treesitter.lua
-- Syntax parsing & highlighting (fast + accurate)

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c", "cpp", "python", "lua",
        "javascript", "typescript",
        "html", "css", "vim",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    },
  },
}
