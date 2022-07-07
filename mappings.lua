return {
  -- Normal mode
  n = {
    -- second key is the lefthand side of the map
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<C-ö>"] = { ":ToggleTerm<CR>", desc = "Toggle Terminal" },
    ["<C-k>"] = { ":TexlabBuild<CR>", desc = "Texlab Build" },
  },
  -- Insert mode
  i = {
    ["jk"] = { "<Esc>", desc = "Escape insert mode" },
    ["kj"] = { "<Esc>", desc = "Escape insert mode" },
    ["<C-k>"] = { ":TexlabBuild<CR>", desc = "Texlab Build" },
  },
  -- Command mode
  c = {
    -- ["<esc>"] = false,
  },
  -- Normal mode
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  -- Visual and select mode
  v = {
    -- ["<esc>"] = false,
  },
  -- Select mode
  s = {
    -- ["<esc>"] = false,
  },
  -- Visual mode
  x = {
    -- ["<esc>"] = false,
  },
  -- Operator pending mode
  o = {
    -- ["<esc>"] = false,
  },
  -- Insert, Command & Lang mode
  l = {
    -- ["<esc>"] = false,
  },
}
