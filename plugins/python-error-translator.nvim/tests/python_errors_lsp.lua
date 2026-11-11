vim.opt.runtimepath:prepend(vim.fn.getcwd())
require("python-error-translator").setup()
local path = vim.fn.getcwd() .. "/tests/fixtures/python_errors.py"
vim.cmd.edit(path)
local buf = vim.api.nvim_get_current_buf()
local client_id = vim.lsp.start({
    name = "pyright",
    cmd = { vim.fn.exepath("pyright-langserver"), "--stdio" },
    root_dir = vim.fn.getcwd() .. "/tests/fixtures",
    settings = { python = { analysis = { typeCheckingMode = "strict" } } },
})
assert(client_id, "Pyright did not start")
local client = assert(vim.lsp.get_client_by_id(client_id))
local success = vim.wait(30000, function()
    return #vim.diagnostic.get(buf) >= 25
end, 100)
if not success then
    client:stop(true)
    error("Pyright did not publish the expected diagnostics")
end

local expected = {
    reportMissingImports = "Pyright can't find",
    reportUndefinedVariable = "Pyright can't find a definition",
    reportArgumentType = '"repeat" expects "int" for "count"',
    reportAssignmentType = "This variable expects",
    reportReturnType = "This function should return",
    reportPossiblyUnboundVariable = "may not have a value here",
    reportOptionalMemberAccess = "This value may be None",
    reportOptionalSubscript = "This value may be None",
    reportOptionalCall = "This value may be None",
    reportAttributeAccessIssue = "You can't access",
    reportOperatorIssue = "You can't use",
    reportIndexIssue = 'This operation needs a "__getitem__" method',
    reportAbstractUsage = "still has abstract members",
    reportTypedDictNotRequiredAccess = "You can't safely read this TypedDict key",
    reportCallIssue = "None of the overloads",
    reportGeneralTypeIssues = "You can't await",
}
local raw_headlines = {
    'Argument of type "str" cannot be assigned to parameter',
    'Import "python_errors_nonexistent_package" could not be resolved',
    '"undefined_name" is not defined',
}
local diagnostics = vim.diagnostic.get(buf)
local found = {}
for _, diagnostic in ipairs(diagnostics) do
    for _, headline in ipairs(raw_headlines) do
        assert(diagnostic.message:sub(1, #headline) ~= headline,
            "Raw Pyright message leaked through: " .. diagnostic.message)
    end
    local prefix = expected[diagnostic.code]
    if prefix and diagnostic.message:find(prefix, 1, true) then
        found[diagnostic.code] = true
    end
end
for rule in pairs(expected) do
    assert(found[rule], "Missing real Pyright translation for " .. rule)
end

vim.api.nvim_win_set_cursor(0, { 11, 0 })
local float_buf, float_win = vim.diagnostic.open_float(buf, {
    scope = "line", header = false, prefix = "", max_width = 90,
})
assert(float_buf and float_win, "Live diagnostic float did not open")
local text = table.concat(vim.api.nvim_buf_get_lines(float_buf, 0, -1, false), "\n")
local unwrapped = text:gsub("%s+", " ")
assert(unwrapped:find('"repeat" expects "int" for "count", but you passed "', 1, true),
    "Float lacks the plain-English explanation: " .. text)
assert(not text:find('Argument of type "str" cannot be assigned', 1, true), "Float shows the raw message")
vim.api.nvim_win_close(float_win, true)
client:stop(true)
print(string.format("Live Pyright: %d diagnostics translated; %d rule families checked",
    #diagnostics, vim.tbl_count(expected)))
