local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<C-s>", ":w!<CR>", opts)
map("n", "bd", ":bd<CR>", opts)
--map("n", "-", ":ToggleTerm<CR>", opts)
map("n", "<C-ß>", ":ToggleTerm<CR>", opts) -- For neovide
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

