-- Run from the package root: nvim --headless -u NONE -l tests/python_errors.lua
vim.opt.runtimepath:prepend(vim.fn.getcwd())
local ok, translator = pcall(require, "python-error-translator")
assert(ok, "Python diagnostic translator is not implemented")

local function equal(actual, expected)
    assert(vim.deep_equal(actual, expected),
        "Expected " .. vim.inspect(expected) .. ", got " .. vim.inspect(actual))
end

local argument = 'Argument of type "str" cannot be assigned to parameter "count" of type "int" in function "repeat"'
local explanation = '"repeat" expects "int" for "count", but this argument has type "str".'
equal(translator.translate(argument), explanation)
equal(translator.translate(argument .. '\n  "str" is not assignable to "int"'),
    explanation .. '\n  "str" is not assignable to "int"')
equal(translator.translate('Type "dict[str, list[int | None]]" is not assignable to declared type "list[str]"'),
    'This value has type "dict[str, list[int | None]]", but the declared type is "list[str]".')
equal(translator.translate('"path" is possibly unbound'),
    'Some code paths reach this use of "path" without assigning it a value.')
equal(translator.translate('"path" is unbound'),
    '"path" is used before it has a value in this scope.')
equal(translator.translate('"path" is not defined'),
    'Python cannot find a definition of "path" in this scope. Check its spelling, definition, or import.')
equal(translator.translate('Object of type "None" is not subscriptable'),
    'This value may be None, so indexing it with [...] is unsafe. Check for None before indexing.')
equal(translator.translate('Import "company_sdk" could not be resolved'),
    'Pyright cannot find "company_sdk" in the configured Python environment or import paths. Check the interpreter, installation, and project paths.')
equal(translator.translate('Import "company_sdk" could not be resolved from source'),
    'Pyright found type information for "company_sdk", but cannot find its implementation in the configured environment. Check the interpreter and package installation.')

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

local diagnostic = { source = "Pyright", code = "reportArgumentType", message = argument, lnum = 0, col = 3 }
local original = vim.deepcopy(diagnostic)
equal(translator.format(diagnostic), explanation .. "\n\nOriginal Pyright diagnostic:\n" .. argument)
equal(diagnostic, original)
equal(translator.format({ source = "ruff", message = argument }), argument)
equal(translator.format({ source = "lua_ls", message = argument }), argument)
equal(translator.format({ message = argument }), argument)
equal(translator.format({ source = "Pyright", message = "Unrecognized diagnostic" }), "Unrecognized diagnostic")

vim.diagnostic.config({
    float = { border = "rounded", source = true },
    virtual_text = false,
    virtual_lines = false,
})
translator.setup()
translator.setup()
local config = vim.diagnostic.config()
equal(config.virtual_text, false)
equal(config.virtual_lines, false)
equal(config.float.border, "rounded")
equal(config.float.source, true)
equal(config.float.format(diagnostic), explanation .. "\n\nOriginal Pyright diagnostic:\n" .. argument)

local buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(buf, 0, -1, false, { 'repeat("bad")' })
local namespace = vim.api.nvim_create_namespace("python-errors-test")
vim.diagnostic.set(namespace, buf, { diagnostic })
local float_buf, float_win = vim.diagnostic.open_float(buf, { scope = "buffer", header = false, prefix = "" })
assert(float_buf and float_win, "Diagnostic float did not open")
local lines = table.concat(vim.api.nvim_buf_get_lines(float_buf, 0, -1, false), "\n")
assert(lines:find(explanation, 1, true), "Float is missing the explanation")
assert(lines:find(argument, 1, true), "Float lost the original diagnostic")
equal(vim.diagnostic.get(buf)[1].message, argument)
vim.api.nvim_win_close(float_win, true)
vim.api.nvim_set_current_buf(buf)
vim.diagnostic.setloclist({ open = false })
equal(vim.fn.getloclist(0)[1].text, argument)

vim.diagnostic.config({ virtual_text = { spacing = 7 }, virtual_lines = { current_line = true } })
translator.setup()
config = vim.diagnostic.config()
equal(config.virtual_text.spacing, 7)
equal(config.virtual_lines.current_line, true)
equal(config.virtual_text.format(diagnostic), explanation .. "\n\nOriginal Pyright diagnostic:\n" .. argument)
equal(config.virtual_lines.format(diagnostic), explanation .. "\n\nOriginal Pyright diagnostic:\n" .. argument)

print("Python diagnostic translation and float checks passed")
