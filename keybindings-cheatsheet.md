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

## General

| Keybinding | Description |
|------------|-------------|
| `<Space>` | Leader key |
| `jk` / `kj` / `<C-c>` | Exit insert mode |
| `Q` | Disabled (prevents entering Ex mode) |
| `<leader>u` | Toggle Undotree |

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
| `<C-f>` | Open tmux sessionizer |

## Text Manipulation

| Keybinding | Description |
|------------|-------------|
| `J` (visual mode) | Move selected line down |
| `K` (visual mode) | Move selected line up |
| `<leader>o` | Insert blank line below |
| `<leader>O` | Insert blank line above |

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
| `<leader>vf` | Format code |
| `<C-h>` (insert mode) | Show signature help |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>vq` | Add diagnostics to location list |

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
| `<leader>pr` | Find recent files |
| `<leader>pb` | Find buffers |
| `<leader>pws` | Search for word under cursor |
| `<leader>pWs` | Search for WORD under cursor |
| `<leader>ps` | Search with grep |
| `<leader>pg` | Live grep |
| `<leader>pd` | Find diagnostics |
| `<leader>psy` | Find document symbols |
| `<leader>psr` | Find references |
| `<leader>vh` | Find help tags |
| `<leader>pm` | Find marks |
| `<leader>pk` | Find keymaps |
| `<leader>pc` | Find commands |

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

## Tips for Learning Keybindings

1. **Start with the basics**: Focus on learning the most frequently used keybindings first, such as navigation and file operations.

2. **Use mnemonics**: Many keybindings follow patterns that make them easier to remember:
   - `<leader>p` prefixes are for "find/pick" operations (Telescope)
   - `<leader>v` prefixes are for LSP operations
   - `<leader>g` prefixes are for Git operations
   - `<leader>t` prefixes are for Trouble operations

3. **Practice regularly**: Try to use keybindings instead of mouse operations whenever possible.

4. **Incremental learning**: Add a few new keybindings to your workflow each week rather than trying to learn them all at once.

5. **Create your own**: If you find yourself performing a specific action frequently, consider adding your own keybinding for it.

## Keybinding Patterns

- **Navigation**: `<C-d>`, `<C-u>`, `n`, `N` - All center the cursor after movement
- **LSP**: Most LSP commands start with `<leader>v`
- **Telescope**: Most Telescope commands start with `<leader>p`
- **Harpoon**: File navigation with `<leader>1-4`, management with `<leader>a`
- **Git**: Git commands start with `<leader>g`
- **Trouble**: Trouble commands start with `<leader>t` 