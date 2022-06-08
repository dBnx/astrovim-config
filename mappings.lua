--local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local unmap = vim.keymap.del
local is_available = astronvim.is_available

map("n", "bd", ":bd<CR>")
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

unmap("n", "<C-s>")
map("n", "<C-s>", ":w!<CR>")

if is_available "nvim-toggleterm.lua" then
  if not vim.g.neovide then
    map("n", "-", ":ToggleTerm<CR>") -- For the terminal
  else
    map("n", "<C-ß>", ":ToggleTerm<CR>") -- For neovide
  end
end
