# Neovim Keybindings Cheatsheet

This document provides a comprehensive reference for all keybindings in my Neovim configuration.

## Table of Contents
- [General](#general)
- [Navigation](#navigation)
- [File Navigation](#file-navigation)
- [Text Manipulation](#text-manipulation)
- [Clipboard Operations](#clipboard-operations)
- [Search and Replace](#search-and-replace)
- [LSP (Language Server Protocol)](#lsp-language-server-protocol)
- [Git Operations](#git-operations)
- [Quickfix and Location List](#quickfix-and-location-list)
- [Harpoon](#harpoon)
- [Telescope](#telescope)
- [Zen Mode](#zen-mode)
- [Trouble](#trouble)
- [Miscellaneous](#miscellaneous)
- [Completion](#completion)

## General

| Keybinding | Description |
|------------|-------------|
| `<Space>` | Leader key |
| `jk` / `kj` / `<C-c>` | Exit insert mode |
| `Q` | Disabled (prevents entering Ex mode) |
| `<leader>u` | Toggle Undotree |
| `:` | Open command line with FineCmdline |

## Navigation

| Keybinding | Description |
|------------|-------------|
| `<C-d>` | Scroll down and center |
| `<C-u>` | Scroll up and center |
| `n` | Next search result and center |
| `N` | Previous search result and center |
| `J` (normal mode) | Join lines and keep cursor position |

## File Navigation

| Keybinding | Description |
|------------|-------------|
| `<leader>pv` | Open Netrw file explorer |
| `<leader>pf` | Find files (Telescope) |
| `<C-p>` | Find git files (Telescope) |

## Text Manipulation

| Keybinding | Description |
|------------|-------------|
| `J` (visual mode) | Move selected line down |
| `K` (visual mode) | Move selected line up |
| `<leader>o` | Insert blank line below |
| `<leader>O` | Insert blank line above |
| `<leader>=` | Format buffer with Neoformat or LSP |

## Clipboard Operations

| Keybinding | Description |
|------------|-------------|
| `<leader>p` (visual mode) | Paste without yanking |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>d` | Delete without yanking |

## Search and Replace

| Keybinding | Description |
|------------|-------------|
| `<leader>s` | Search and replace word under cursor |
| `<leader>pws` | Search for word under cursor (Telescope) |
| `<leader>pWs` | Search for WORD under cursor (Telescope) |
| `<leader>ps` | Search with grep (Telescope) |
| `<leader>pg` | Live grep (Telescope) |

## LSP (Language Server Protocol)

| Keybinding | Description |
|------------|-------------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Show hover information |
| `<leader>vws` | Search workspace symbols |
| `<leader>vd` | Show diagnostics |
| `<leader>vca` | Code action |
| `<leader>vrr` | Find references |
| `<leader>vrn` | Rename symbol |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>vq` | Add diagnostics to location list |
| `<leader>q` | Close window and return focus |
| `<leader>rr` | Select refactoring |

## Git Operations

| Keybinding | Description |
|------------|-------------|
| `<leader>gs` | Open Git status (Fugitive) |
| `<leader>p` | Git push (in Fugitive buffer) |
| `<leader>P` | Git pull with rebase (in Fugitive buffer) |
| `<leader>t` | Git push to origin with tracking setup (in Fugitive buffer) |
| `gu` | Get changes from left side during merge conflict (//2) |
| `gh` | Get changes from right side during merge conflict (//3) |

## Quickfix and Location List

| Keybinding | Description |
|------------|-------------|
| `<C-k>` | Next quickfix item |
| `<C-j>` | Previous quickfix item |
| `<leader>k` | Next location list item |
| `<leader>j` | Previous location list item |

## Harpoon

| Keybinding | Description |
|------------|-------------|
| `<leader>a` | Add file to harpoon |
| `<C-e>` | Toggle harpoon quick menu |
| `<leader>1` | Navigate to harpoon file 1 |
| `<leader>2` | Navigate to harpoon file 2 |
| `<leader>3` | Navigate to harpoon file 3 |
| `<leader>4` | Navigate to harpoon file 4 |
| `<leader>ap` | Navigate to previous harpoon file |
| `<leader>an` | Navigate to next harpoon file |

## Telescope

| Keybinding | Description |
|------------|-------------|
| `<leader>pf` | Find files |
| `<C-p>` | Find git files |
| `<leader>pws` | Search for word under cursor |
| `<leader>pWs` | Search for WORD under cursor |
| `<leader>ps` | Search with grep |
| `<leader>pg` | Live grep |

## Zen Mode

| Keybinding | Description |
|------------|-------------|
| `<leader>zz` | Toggle Zen mode (with numbers) |
| `<leader>zZ` | Toggle Zen mode (minimal, no numbers) |

## Trouble

| Keybinding | Description |
|------------|-------------|
| `<leader>tT` | Toggle Trouble diagnostics |
| `<leader>tt` | Toggle Trouble buffer diagnostics |
| `<leader>tL` | Toggle Trouble location list |
| `<leader>tQ` | Toggle Trouble quickfix list |
| `[t` | Previous Trouble/Quickfix item |
| `]t` | Next Trouble/Quickfix item |

## Miscellaneous

| Keybinding | Description |
|------------|-------------|
| `<leader>x` | Make current file executable |
| `<leader>mr` | Make it rain (CellularAutomaton) |

## Completion

| Keybinding | Description |
|------------|-------------|
| `<C-p>` | Select previous item |
| `<C-n>` | Select next item |
| `<C-y>` | Confirm selection |
| `<C-Space>` | Complete |
| `<CR>` | Confirm selection |

## Tips for Learning Keybindings

1. **Use mnemonics**: Many keybindings follow patterns that make them easier to remember:
   - `<leader>v` prefixes are for LSP operations
   - `<leader>p` prefixes are for "find/pick" operations (Telescope)
   - `<leader>g` prefixes are for Git operations
   - `<leader>t` prefixes are for Trouble operations
   - `<leader>z` prefixes are for Zen mode operations
   - `<leader>a` prefixes are for Harpoon operations
