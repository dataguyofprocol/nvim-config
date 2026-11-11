# python-error-translator.nvim

Plain-English explanations for Pyright type errors in Neovim, inspired by
[ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim).

Pyright's messages name types precisely but read like compiler internals:
`Argument of type "str" cannot be assigned to parameter "count" of type "int"
in function "repeat"`. This plugin rewrites each message in place, before it
reaches any diagnostic display:

> `"repeat" expects "int" for "count", but you passed "str".`

Each explanation states the problem in one or two short sentences. Suggestions
are included only when the message gives enough context for a specific next step.

The translation appears everywhere the message does: floats, virtual text,
virtual lines, and the location list. Detail lines below the headline, ranges,
severities, and code actions are untouched. Unknown messages pass through
unchanged.

## Installation

lazy.nvim, from a local checkout:

```lua
{
    dir = vim.fn.stdpath("config") .. "/plugins/python-error-translator.nvim",
    name = "python-error-translator.nvim",
    main = "python-error-translator",
    lazy = false,
    opts = {},
}
```

Any plugin manager, or none: put the folder on your runtimepath and call
`require("python-error-translator").setup()` before your language servers
start.

## Configuration

```lua
require("python-error-translator").setup({
    servers = { "pyright", "basedpyright" },
})
```

`servers` lists the LSP client names whose diagnostics get translated.

## How it works

- `lua/python-error-translator/db.lua` is the catalog: 172 Pyright 1.1.408
  message templates with plain-English rewrites. Each entry has an `id`, the
  exact Pyright `pattern` with `{placeholder}` captures, and an
  `improved_message` that reuses those placeholders. Edit it directly; entry
  order never matters.
- `lua/python-error-translator/init.lua` hooks the diagnostic handlers
  (`textDocument/publishDiagnostics` on older Neovim builds, the
  `vim.lsp.diagnostic` push and pull entry points on newer ones), rewrites
  messages for the configured servers, and passes everything to the original
  handler.

Template texts are Pyright's; Microsoft's MIT license for them is kept in
`LICENSE.pyright`.

## Tests

Run from the package root:

```sh
nvim --headless -u NONE -l tests/python_errors.lua
nvim --headless -u NONE -l tests/python_errors_lsp.lua
```

The first test checks every catalog entry, placeholder preservation, and detail
lines. The second needs `pyright-langserver` on `PATH`. It starts a real server
against an intentionally invalid fixture and checks 16 rule families arrive
translated, without executing any Python.
