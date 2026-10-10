return {
    "sbdchd/neoformat",
    config = function()
        vim.g.neoformat_enabled_python = { "ruff" }
        vim.g.neoformat_try_formatprg = 1

        vim.keymap.set("n", "<leader>=", function()
            if vim.g["neoformat_enabled_" .. vim.bo.filetype] then
                vim.cmd("Neoformat")
            else
                vim.lsp.buf.format({ timeout_ms = 3000 })
            end
        end, { desc = "Format buffer (Ruff for Python, LSP otherwise)" })
    end,
}
