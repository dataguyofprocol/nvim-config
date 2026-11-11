# Python diagnostic explanations

This self-contained Neovim plugin adds plain-English explanations to Pyright diagnostics.
In this config, open a Python file, place the cursor on an error, and press `<Space>vd`.
The float shows the explanation followed by the complete original diagnostic.

## Load the package

All runtime code, scripts, tests, and licenses live in this folder. The config
loads it through `lua/batra/lazy/python_errors.lua` as a local lazy.nvim plugin:

```lua
{
    dir = vim.fn.stdpath("config") .. "/plugins/python-error-translator.nvim",
    name = "python-error-translator.nvim",
    main = "python-error-translator",
    lazy = false,
    priority = 1000,
    opts = {},
}
```

To use the folder in another config, point `dir` at its location. Without
lazy.nvim, put the package on Neovim's runtimepath and call
`require("python-error-translator").setup()` after configuring diagnostic displays.

The catalog covers 172 English message templates from Pyright 1.1.408, the version
installed through Mason in this config. It includes imports, names, argument and
return types, None checks, attributes, indexing, operators, TypedDicts, async,
overrides, generics, unknown types, unused code, and common syntax mistakes.
These are supported templates, not a frequency ranking or every possible Python error.
Runtime exceptions and diagnostics from Ruff, mypy, and other servers are outside
this extension's scope.

Only diagnostics whose source is `Pyright` or `pyright` receive explanations.
Unknown messages retain their original text. Type-checking modes and severities
do not change. Stored diagnostics, location lists, code actions, ranges, and related
information remain untouched. The extension uses Neovim's display formatters,
so it does not depend on whether a diagnostic arrived through push or pull.
Enabled virtual-text and virtual-line displays use the formatter too; disabled
displays stay disabled. The config loads the extension before the language servers.

## Verify the extension

Run these commands from this package's root:

```sh
nvim --headless -u NONE -l tests/python_errors.lua
nvim --headless -u NONE -l tests/python_errors_lsp.lua
```

The LSP test needs `pyright-langserver` on `PATH`. It analyzes the intentionally
invalid fixture without executing Python. It checks live translations across
16 rule families and preservation of the original diagnostics.

## Maintain the catalog

Edit `scripts/python-errors-translations.json`, then regenerate the Lua catalog:

```sh
node scripts/build-python-errors.mjs
```

Node is needed only for regeneration, not during editing. The generator fetches
the pinned English catalog, validates every localization key and placeholder,
and writes `rules.lua`. An optional local catalog path avoids the network:

```sh
node scripts/build-python-errors.mjs /path/to/package.nls.en-us.json
```

On a Pyright upgrade, update the generator's version, regenerate, and rerun the
tests. Messages with changed wording fall back to the original until the catalog
is updated. Each translation must distinguish the actual and expected types,
preserve names, and avoid promising a fix without enough context.

Sources: [Pyright's pinned message catalog](https://github.com/microsoft/pyright/blob/1.1.408/packages/pyright-internal/src/localization/package.nls.en-us.json),
[diagnostic rules](https://github.com/microsoft/pyright/blob/1.1.408/packages/pyright-internal/src/common/diagnosticRules.ts),
and [Neovim diagnostic formatters](https://neovim.io/doc/user/diagnostic.html).
The copied Pyright templates retain Microsoft's MIT license in `LICENSE.pyright`.
