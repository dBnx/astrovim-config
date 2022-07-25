return {
  -- Normal mode
  n = {
    -- second key is the lefthand side of the map
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<C-ö>"] = { ":ToggleTerm<CR>", desc = "Toggle Terminal" },
    ["<C-k>"] = { ":TexlabBuild<CR>", desc = "Texlab Build" },
    ["k"] = { "gk", desc = "Move visual line up" },
    ["j"] = { "gj", desc = "Move visual line down" },
    ["<c-t>"] = { ":TroubleToggle<CR>", desc = "Toggle trouble" },
  },
  -- Insert mode
  i = {
    ["jk"] = { "<Esc>", desc = "Escape insert mode" },
    ["kj"] = { "<Esc>", desc = "Escape insert mode" },
    ["<C-ö>"] = { ":ToggleTerm<CR>", desc = "Toggle Terminal" },
    ["<C-k>"] = { ":TexlabBuild<CR>", desc = "Texlab Build" },
    ["<c-t>"] = { ":TroubleToggle<CR>", desc = "Toggle trouble" },
  },
  -- Command mode
  c = {
    -- ["<esc>"] = false,
  },
  -- Terminal mode
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- ["<esc>"] = false,
    --["k"] = { "", desc = "Move visual line up" },
    --["j"] = { "", desc = "Move visual line down" },
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
