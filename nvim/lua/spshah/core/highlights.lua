
-- lua/spshah/core/highlights.lua
-- Custom highlight overrides (theme-agnostic)

local hl = vim.api.nvim_set_hl

-- Diff readability
hl(0, "DiffAdd",    { bold = true, bg = "#5bb899" })
hl(0, "DiffDelete", { bold = true, bg = "#db6c6c" })
hl(0, "DiffChange", { underline = true, bg = "#3c4855" })
hl(0, "DiffText",   { bold = true, bg = "#d5bc02" })

-- Errors & TODOs should scream
hl(0, "Todo",     { bold = true, bg = "Red" })
hl(0, "Error",    { bold = true, bg = "Red" })
hl(0, "ErrorMsg", { bold = true, bg = "Red" })

-- Constants deserve emphasis
hl(0, "Constant", { bold = true, fg = "Yellow" })
