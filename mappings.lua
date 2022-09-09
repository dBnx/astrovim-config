return {
  -- Normal mode
  n = {
    ["k"] = { "gk", desc = "Move visual line up" },
    ["j"] = { "gj", desc = "Move visual line down" },
    -- second key is the lefthand side of the map
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<C-ö>"] = { ":ToggleTerm<CR>", desc = "Toggle Terminal" },
    --["<C-k>"] = { ":TexlabBuild<CR>", desc = "Texlab Build" },
    ["<c-t>"] = { ":TroubleToggle<CR>", desc = "Toggle trouble" },
    ["<c-k>"] = { "1z=", desc = "Correct spelling with best suggestion" },
    ["ff"] = { ":TexlabForward<CR>", desc = "Forward search from current position" },

    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

    -- Debugging
    ["<F9>"] = { ":lua require'dap'.continue()<cr>", desc = "Launch/continue debug session" },
    ["<F10>"] = { ":lua require'dap'.step_into()<cr>", desc = "Step Into" },
    ["<F11>"] = { ":lua require'dap'.step_over()<cr>", desc = "Step Over" },
    ["<F12>"] = { ":lua require'dap'.step_out()<cr>", desc = "Step Out" },
    ["<leader>ac"] = { ":lua require'dap'.continue()<cr>", desc = "Launch/continue debug session" },
    ["<leader>ai"] = { ":lua require'dap'.step_into()<cr>", desc = "Step Into" },
    ["<leader>ao"] = { ":lua require'dap'.step_over()<cr>", desc = "Step Over" },
    ["<leader>aa"] = { ":lua require'dap'.step_out()<cr>", desc = "Step Out" },
    ["<leader>ab"] = { ":lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
    ["<leader>aw"] = { ":call vimspector#AddWatch()<cr>", desc = "Add to watch" },
    ["<leader>ae"] = { ":call vimspector#Evaluate()<cr>", desc = "Evaluate" },
    ---nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    ---nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
    ---nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
    ---nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
    --nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    --nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    --nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    --nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
    --nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
  },
  -- Insert mode
  i = {
    ["jk"] = { "<Esc>", desc = "Escape insert mode" },
    ["kj"] = { "<Esc>", desc = "Escape insert mode" },
    ["<C-ö>"] = { ":ToggleTerm<CR>", desc = "Toggle Terminal" },
    --["<C-k>"] = { ":TexlabBuild<CR>", desc = "Texlab Build" },
    ["<c-t>"] = { ":TroubleToggle<CR>", desc = "Toggle trouble" },
    ["<c-k>"] = { "1z=", desc = "Correct spelling with best suggestion" },
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
