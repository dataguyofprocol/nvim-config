local M = {}

local config = { servers = { "pyright", "basedpyright" } }

local rules = {}
for _, entry in ipairs(require("python-error-translator.db")) do
    entry.weight = #(entry.pattern:gsub("{%w+}", ""))
    rules[#rules + 1] = entry
end

table.sort(rules, function(a, b)
    if a.weight ~= b.weight then
        return a.weight > b.weight
    end
    return a.id < b.id
end)

local memo = {}

local function escape(text)
    return (text:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1"))
end

local function compiled(entry)
    if not entry.compiled_pattern then
        local names, parts, cursor = {}, { "^" }, 1
        while true do
            local start, finish, name = entry.pattern:find("{(%w+)}", cursor)
            if not start then
                parts[#parts + 1] = escape(entry.pattern:sub(cursor)) .. "$"
                break
            end
            parts[#parts + 1] = escape(entry.pattern:sub(cursor, start - 1)) .. "(.-)"
            names[#names + 1] = name
            cursor = finish + 1
        end
        entry.compiled_pattern = table.concat(parts)
        entry.compiled_names = names
    end
    return entry.compiled_pattern, entry.compiled_names
end

function M.translate(message)
    if memo[message] then
        return memo[message]
    end
    local headline = message:match("^[^\n]*")
    local translated = message
    for _, entry in ipairs(rules) do
        local pattern, names = compiled(entry)
        local captures = { headline:match(pattern) }
        if #captures > 0 and (#names == 0 or #captures == #names) then
            local values = {}
            for index, name in ipairs(names) do
                values[name] = captures[index]
            end
            local complete = true
            local filled = (entry.improved_message:gsub("{(%w+)}", function(name)
                local value = values[name]
                if value == nil then
                    complete = false
                end
                return value
            end))
            if complete then
                translated = filled .. message:sub(#headline + 1)
                break
            end
        end
    end
    memo[message] = translated
    return translated
end

function M.setup(opts)
    config = vim.tbl_deep_extend("force", config, opts or {})
    local function translate(result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if not (client and result and vim.tbl_contains(config.servers, client.name)) then
            return
        end
        for _, diagnostic in ipairs(result.diagnostics or result.items or {}) do
            diagnostic.message = M.translate(diagnostic.message)
        end
    end
    local function wrap(name)
        local original = vim.lsp.diagnostic[name]
        if original then
            vim.lsp.diagnostic[name] = function(err, result, ctx, handler_config)
                translate(result, ctx)
                return original(err, result, ctx, handler_config)
            end
        end
    end
    local original = vim.lsp.handlers["textDocument/publishDiagnostics"]
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, handler_config)
        translate(result, ctx)
        return original(err, result, ctx, handler_config)
    end
    wrap("on_publish_diagnostics")
    wrap("on_diagnostic")
end

return M
