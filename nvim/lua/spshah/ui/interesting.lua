
-- lua/spshah/ui/interesting.lua

local hl = vim.api.nvim_set_hl

local colors = {
  "#ffa724", "#aeee00", "#8cffba",
  "#b88853", "#ff9eb8", "#ff2c4b",
}

for i, c in ipairs(colors) do
  hl(0, "InterestingWord" .. i, { fg = "#000000", bg = c })
end

vim.cmd([[
function! HiInterestingWord(n)
  normal! mz"zyiw
  let id = 77750 + a:n
  silent! call matchdelete(id)
  call matchadd("InterestingWord".a:n, '\V\<'.escape(@z,'\').'\>', 1, id)
  normal! `z
endfunction

function! ClearAllHi()
  for i in range(1,6)
    silent! call matchdelete(77750 + i)
  endfor
endfunction
]])

for i = 1, 6 do
  vim.keymap.set("n", "<leader>" .. i,
    ":call HiInterestingWord(" .. i .. ")<CR>", { silent = true })
end
vim.keymap.set("n", "<leader>0", ":call ClearAllHi()<CR>", { silent = true })
