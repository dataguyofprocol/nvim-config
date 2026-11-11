local M = {}
local rules = {}

local function escape(text)
    return (text:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1"))
end

for _, entry in ipairs(require("batra.python_errors.rules")) do
    local template, explanation = entry[1], entry[2]
    local names, parts, cursor = {}, { "^" }, 1
    while true do
        local start, finish, name = template:find("{([%w_]+)}", cursor)
        if not start then
            parts[#parts + 1] = escape(template:sub(cursor)) .. "$"
            break
        end
        parts[#parts + 1] = escape(template:sub(cursor, start - 1)) .. "(.-)"
        names[#names + 1] = name
        cursor = finish + 1
    end
    rules[#rules + 1] = {
        pattern = table.concat(parts), names = names, explanation = explanation,
    }
end

---Translate a known Pyright headline, retaining every diagnostic detail line.
---@param message string
---@return string
function M.translate(message)
    local headline = message:match("^[^\n]*")
    for _, rule in ipairs(rules) do
        local captures = { headline:match(rule.pattern) }
        if #captures > 0 then
            local values = {}
            for index, name in ipairs(rule.names) do
                values[name] = captures[index]
            end
            local explanation = rule.explanation:gsub("{([%w_]+)}", function(name)
                return values[name]
            end)
            return explanation .. message:sub(#headline + 1)
        end
    end
    return message
end

---Display an explanation alongside the original; never change stored diagnostics.
---@param diagnostic vim.Diagnostic
---@return string
function M.format(diagnostic)
    if diagnostic.source ~= "Pyright" and diagnostic.source ~= "pyright" then
        return diagnostic.message
    end
    local translated = M.translate(diagnostic.message)
    if translated == diagnostic.message then
        return diagnostic.message
    end
    local headline = translated:match("^[^\n]*")
    return headline .. "\n\nOriginal Pyright diagnostic:\n" .. diagnostic.message
end

---Install formatters without enabling disabled diagnostic displays.
function M.setup()
    local config, options = vim.diagnostic.config(), {}
    for _, name in ipairs({ "float", "virtual_text", "virtual_lines" }) do
        local value = config[name]
        if value then
            options[name] = type(value) == "table" and vim.deepcopy(value) or {}
            options[name].format = M.format
        end
    end
    vim.diagnostic.config(options)
end

return M
