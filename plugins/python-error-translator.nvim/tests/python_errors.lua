vim.opt.runtimepath:prepend(vim.fn.getcwd())
local ok, translator = pcall(require, "python-error-translator")
assert(ok, "python-error-translator is not implemented")

local function equal(actual, expected)
    assert(vim.deep_equal(actual, expected),
        "Expected " .. vim.inspect(expected) .. ", got " .. vim.inspect(actual))
end

local argument = 'Argument of type "str" cannot be assigned to parameter "count" of type "int" in function "repeat"'
local explanation = '"repeat" expects "int" for "count", but this argument has type "str". Convert the argument, or update the annotation of "count" in "repeat".'
equal(translator.translate(argument), explanation)
equal(translator.translate(argument .. '\n  "str" is not assignable to "int"'),
    explanation .. '\n  "str" is not assignable to "int"')
equal(translator.translate('Type "dict[str, list[int | None]]" is not assignable to declared type "list[str]"'),
    'This value has type "dict[str, list[int | None]]", but the declared type is "list[str]". Update the declaration to match the value, or convert the value.')
equal(translator.translate('"path" is possibly unbound'),
    'Some code paths reach this use of "path" without assigning it a value. Assign a value in every branch, or initialize the variable before the conditional.')
equal(translator.translate('"path" is unbound'),
    '"path" is used before it has a value in this scope.')
equal(translator.translate('"path" is not defined'),
    'Python cannot find a definition of "path" in this scope. Check its spelling, definition, or import.')
equal(translator.translate('Object of type "None" is not subscriptable'),
    'This value may be None, so indexing it with [...] is unsafe. Check for None before indexing. Guard with "if value is not None" before indexing.')
equal(translator.translate('Import "company_sdk" could not be resolved'),
    'Pyright cannot find "company_sdk" in the configured Python environment or import paths. Check the interpreter, installation, and project paths. Install the package into the configured interpreter, or point Pyright at the right environment in pyrightconfig.json.')
equal(translator.translate('Import "company_sdk" could not be resolved from source'),
    'Pyright found type information for "company_sdk", but cannot find its implementation in the configured environment. Check the interpreter and package installation. Usually safe to ignore: types come from bundled stubs. Install the package to silence it.')

for _, message in ipairs({
    "A future Pyright diagnostic",
    argument .. " with an unfamiliar new suffix",
    "prefix " .. argument,
    'Argument of type "str" cannot be assigned to parameter "x" of type "int" in function "f"\nextra\nmore',
}) do
    if message:find("\n", 1, true) then
        equal(translator.translate(message):match("\n.*"), message:match("\n.*"))
    else
        equal(translator.translate(message), message)
    end
end

local published
local record = function(_, result)
    published = result
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = record
vim.lsp.diagnostic.on_publish_diagnostics = record
vim.lsp.diagnostic.on_diagnostic = record
local real_client_by_id = vim.lsp.get_client_by_id
vim.lsp.get_client_by_id = function(id)
    return { name = id == 1 and "pyright" or "ruff" }
end
translator.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"](nil,
    { diagnostics = { { message = argument }, { message = "Unrecognized diagnostic" } } }, { client_id = 1 })
equal(published.diagnostics[1].message, explanation)
equal(published.diagnostics[2].message, "Unrecognized diagnostic")

vim.lsp.diagnostic.on_publish_diagnostics(nil,
    { diagnostics = { { message = argument } } }, { client_id = 1 })
equal(published.diagnostics[1].message, explanation)

vim.lsp.diagnostic.on_diagnostic(nil,
    { kind = "full", items = { { message = argument } } }, { client_id = 1 })
equal(published.items[1].message, explanation)

vim.lsp.diagnostic.on_diagnostic(nil,
    { kind = "full", items = { { message = argument } } }, { client_id = 2 })
equal(published.items[1].message, argument)
vim.lsp.get_client_by_id = real_client_by_id

print("Python diagnostic translation checks passed")
