# AGENTS.md

Personal Neovim configuration (kickstart-derived, single user). Not an app: there are
no build, test, or deploy commands. The "product" is the editor itself.

## Layout and load order

- `init.lua` requires `batra` (`lua/batra/init.lua`), which loads in order:
  `set` (options + `vim.g.mapleader`/`have_nerd_font`) -> `remap` (keymaps) ->
  registers the `LspAttach` autocmd -> `lazy_init` (bootstraps lazy.nvim, then
  imports every spec in `lua/batra/lazy/`) -> yank-highlight and
  trim-trailing-whitespace autocmds.
- `set.lua` must load before `remap.lua` and the plugins: the leader is set in
  `remap.lua` line 1, and `have_nerd_font` (set.lua) is read by which-key.
- Registering `LspAttach` *before* `lazy_init` is deliberate: the first client
  to attach (including on the very first launch) still gets its mappings.

## Plugin management

- lazy.nvim (stable branch), auto-bootstrapped in `lua/batra/lazy_init.lua`.
- Specs live one-per-file in `lua/batra/lazy/` (essentials, colors, formatter,
  fugitive, lsp, markdown, telescope, treesitter, undotree, whichkey). To add a
  plugin, create a new file returning its spec.
- **Disabling a spec = renaming its file `.lua` -> `.bak`** (lazy imports only
  `.lua`). Currently parked this way: `avante`, `cloak`, `copilot`, `pyrepl`.
  Don't delete `.bak` files; they come back sometimes.
- `lazy-lock.json` is tracked. Commit it after intentional plugin changes so
  setups stay reproducible.

## Where keymaps live (check all before changing)

- `lua/batra/remap.lua` — general editing, navigation, clipboard, markdown keys
  (`<leader>mp` render-markdown toggle, `<leader>rm` glow float).
- Inside each plugin's `config` in `lua/batra/lazy/` — telescope (`<leader>p*`),
  fugitive (`<leader>g*`), formatter (`<leader>=`), undotree (`<leader>u`).
- `lua/batra/init.lua` `LspAttach` — buffer-local LSP maps (`gd`, `gr`, `K`,
  `<leader>v*`).

## Conventions

- Leader is `<Space>`; every keymap gets a `desc` — which-key (helix preset,
  `delay = 0`, `timeoutlen = 300`) reads them for the instant popup. Keep it.
- Default indent 4 spaces; `colorcolumn = 88`; netrw is the file explorer
  (`<leader>pv`) — no oil/nvim-tree by choice.
- LSP: new API only (`vim.lsp.config` + `mason-lspconfig` `ensure_installed`).
  Servers: `lua_ls`, `pyright`.

## Markdown workflow

- In-buffer rendering: render-markdown.nvim, toggled with `<leader>mp`.
- Read-only render: `<leader>rm` pipes the file through `glow` in a floating
  terminal. Requires the `glow` binary (`brew install glow`); the keymap
  checks for it and degrades to a notify.
- `markdown.lua` also sets wrap/linebreak/spell and clears colorcolumn for
  markdown buffers.
- Treesitter config deliberately sets `syntax = ON` for markdown buffers
  (regex syntax beats TS highlight there). Don't remove.

## Gotchas — "don't fix" list

- The training keymaps in `remap.lua` deliberately block arrow keys in normal
  mode and `<Esc>` in insert mode to force hjkl and jk/kj. `<C-c>` is the
  documented escape hatch while learning. Removing these defeats their purpose.
- Fugitive maps `gu`/`gh` globally (diffget ours/theirs); they're only useful
  inside a merge-conflict diff but exist in every buffer.
- Netrw globals in `lua/batra/init.lua` are intentional; replacing netrw is a
  decision, not a cleanup.

## Verifying changes

```sh
nvim --headless '+lua print("ok")' +qa   # config loads without errors
```

There is no test suite. The bar is: a clean headless startup plus the affected
feature working. Also check `:checkhealth` and `:LspInfo` after LSP changes.
