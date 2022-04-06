local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<C-s>", ":w!<CR>", opts)
map("n", "bd", ":bd<CR>", opts)
map("n", "<C-ß>", ":ToggleTerm<CR>", opts) -- For neovide
map("n", "-", ":ToggleTerm<CR>", opts) -- For the terminal
if not vim.g.neovide then
  map("n", "-", ":ToggleTerm<CR>", opts) -- For the terminal
else
  map("n", "<C-ß>", ":ToggleTerm<CR>", opts) -- For neovide
end
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

