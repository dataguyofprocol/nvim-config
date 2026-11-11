vim.opt.runtimepath:prepend(vim.fn.getcwd())
local ok, translator = pcall(require, "python-error-translator")
assert(ok, "python-error-translator is not implemented")

local function equal(actual, expected)
    assert(vim.deep_equal(actual, expected),
        "Expected " .. vim.inspect(expected) .. ", got " .. vim.inspect(actual))
end

local argument = 'Argument of type "str" cannot be assigned to parameter "count" of type "int" in function "repeat"'
local explanation = '"repeat" expects "int" for "count", but you passed "str".'
equal(translator.translate(argument), explanation)
equal(translator.translate(argument .. '\n  "str" is not assignable to "int"'),
    explanation .. '\n  "str" is not assignable to "int"')
equal(translator.translate('Type "dict[str, list[int | None]]" is not assignable to declared type "list[str]"'),
    'This variable expects "list[str]", but you\'re assigning "dict[str, list[int | None]]".')
equal(translator.translate('"path" is possibly unbound'),
    '"path" may not have a value here. Make sure every branch assigns it before you use it.')
equal(translator.translate('"path" is unbound'),
    'You\'re using "path" before assigning it a value.')
equal(translator.translate('"path" is not defined'),
    'Pyright can\'t find a definition for "path". Check its spelling or define or import it first.')
equal(translator.translate('Object of type "None" is not subscriptable'),
    'This value may be None. Check for None before using [...].')
equal(translator.translate('Import "company_sdk" could not be resolved'),
    'Pyright can\'t find "company_sdk". Check that it\'s installed or on the import path in your selected Python environment.')
equal(translator.translate('Import "company_sdk" could not be resolved from source'),
    'Pyright found type information for "company_sdk", but can\'t find the actual module in your Python environment.')
equal(translator.translate('Argument missing for parameter "count"'),
    'You need to pass a value for "count". To allow omitting it, give the parameter a default.')
equal(translator.translate('Stub file not found for "company_sdk"'),
    'Pyright can\'t find type information for "company_sdk". The package may still work when you run it.')
equal(translator.translate('Operator "+" not supported for types "int" and "str"'),
    'You can\'t use "+" with "int" and "str".')

local catalog = require("python-error-translator.db")
local ids = {}
for _, entry in ipairs(catalog) do
    assert(not ids[entry.id], "Duplicate catalog ID: " .. entry.id)
    ids[entry.id] = true
    local pattern_names, message_names = {}, {}
    local function fill(text, names)
        return (text:gsub("{(%w+)}", function(name)
            names[name] = true
            return "sample_" .. name
        end))
    end
    local message = fill(entry.pattern, pattern_names)
    local expected = fill(entry.improved_message, message_names)
    equal(pattern_names, message_names)
    equal(translator.translate(message), expected)
    equal(translator.translate(message .. "\n  Original detail"), expected .. "\n  Original detail")
    equal(translator.translate(expected), expected)
end

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

print(string.format("Python diagnostic translation checks passed (%d catalog entries)", #catalog))
