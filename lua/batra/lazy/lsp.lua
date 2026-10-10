return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    },
                    workspace = { checkThirdParty = false },
                },
            },
        })
        vim.lsp.config("pyright", {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = false,
                        diagnosticMode = "openFilesOnly",
                    },
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright" },
        })
    end,
}
