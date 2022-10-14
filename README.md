# Custom astrovim configuration

A custom config to work on `Rust`, `C++`, `LaTex`, `(System)Verilog` and `Python`
projects. Many features don't work yet

## Setup

- Backup your `neovim` configuration & install `astronvim`:

```sh
mv ~/.config/nvim ~/.config/nvimbackup
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

- Get this config:

```sh
git clone https://github.com/dBnx/astrovim-config ~/.config/nvim/lua/user
```

- Install all plugins and then quit `:q`

```sh
nvim +PackerSync
```

- Optional: Copy and save the file `~/.config/nvim/lua/user/snippets/private_info_example.lua`
  as `private_info.lua` in the same directory and customize the internal values. That enables
  snippets like `name` or `email`. If this step is skipped it will simply insert blanks.

```sh
cd ~/.config/nvim/lua/user/snippets && \
  cp -v private_info_example.lua private_info.lua && \
  nvim private_info.lua
```

## Credits

I used the `texlab` lsp configuration from TODO.

## TODO's

Roughly from most to least important:

-[X] Rust type inlay hints
-[X] Latex inlay warnings/errors
-[ ] Enable autosnippets
-[ ] Port Latex snippets to LuaSnip
-[ ] Image previewer
-[ ] Debugging
