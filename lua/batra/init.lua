require("batra.set")
require("batra.remap")

local group = vim.api.nvim_create_augroup("Batra", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

vim.filetype.add({ extension = { templ = "templ" } })

vim.diagnostic.config({
    float = { border = "rounded", source = true },
})
require("batra.python_errors").setup()

-- Diagnostics and window navigation don't require an attached language server.
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>vq", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { desc = "Close window" })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Load plugins after registering LspAttach so even the first client gets its mappings.
autocmd("LspAttach", {
    group = group,
    callback = function(event)
        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Go to references")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("gt", vim.lsp.buf.type_definition, "Go to type definition")
        map("K", vim.lsp.buf.hover, "Show hover information")
        map("<leader>vws", vim.lsp.buf.workspace_symbol, "Search workspace symbols")
        map("<leader>vca", vim.lsp.buf.code_action, "Code action")
        map("<leader>vrr", vim.lsp.buf.references, "Find references")
        map("<leader>vrn", vim.lsp.buf.rename, "Rename symbol")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get,
                { buffer = event.buf, desc = "LSP completion" })
        end
    end,
})

require("batra.lazy_init")

autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

autocmd("BufWritePre", {
    group = group,
    command = [[%s/\s\+$//e]],
})
