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

## Text Manipulation

| Keybinding | Description |
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings for testing
vim.opt.number = true
vim.opt.termguicolors = true

-- Load your local plugin
require("lazy").setup({
  {
    dir = "~/PycharmProjects/hexwitch.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- Optional
    },
    config = function()
      require("hexwitch").setup({
        openai_api_key = "OPENAI_API_KEY",
        model = "gpt-4.1-mini",
        ui_mode = "input",
        debug = true, -- Enable debug mode!
      })
    end,
  }
})

-- Test keybinding
vim.keymap.set("n", "<leader>t", "<cmd>Hexwitch<cr>", { desc = "Test Hexwitch" })

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

## LSP (Language Server Protocol)

| Keybinding | Description |
|------------|-------------|
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

## Snippets

| Keybinding | Description |
|------------|-------------|
| `<C-s>e` | Expand snippet |
| `<C-s>;` | Jump to next node |
| `<C-s>,` | Jump to previous node |
| `<C-E>` | Change choice |

## Tips for Learning Keybindings

1. **Use mnemonics**: Many keybindings follow patterns that make them easier to remember:
   - `<leader>v` prefixes are for LSP operations
   - `<leader>p` prefixes are for "find/pick" operations (Telescope)
   - `<leader>g` prefixes are for Git operations
   - `<leader>t` prefixes are for Trouble operations
   - `<leader>z` prefixes are for Zen mode operations
   - `<leader>a` prefixes are for Harpoon operations
