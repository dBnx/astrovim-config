return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    ["<C-ö>"] = { ":ToggleTerm<CR>", desc = "Toggle Terminal" },
  },
  i = {
    ["<C-ö>"] = { "<cmd>ToggleTerm<CR><esc>i", desc = "Toggle Terminal" },
    -- ["<C-char-246>"] = { "<cmd>ToggleTerm<CR><esc>i", desc = "Toggle Terminal" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
