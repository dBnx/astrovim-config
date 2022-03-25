local g = vim.g
local opt = vim.opt

opt.guifont="Fira Code:h15, Symbols Nerd Font:h15"
vim.cmd [[
  set guioptions-=m " rm menu bar
  set guioptions-=t " rm toolbar
  set guioptions-=r " rm rhs scrollbar
  set guioptions-=l " rm lhs scrollbar
]]

g.neovide_refresh_rate = 60
g.neovide_remember_window_size = true
g.neovide_input_use_logo = true
-- g.neovide_transparency = 0.8 -- Fake transparency

