return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        local parsers = require("nvim-treesitter.parsers")

        treesitter.setup({})

        parsers.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")

        local ensure = {
            "vimdoc",
            "python",
            "javascript",
            "lua",
            "bash",
            "regex",
            "markdown",
            "markdown_inline",
            "templ",
        }

        if vim.fn.executable("tree-sitter") == 1 then
            local installed = {}
            for _, lang in ipairs(require("nvim-treesitter.config").get_installed("parsers")) do
                installed[lang] = true
            end

            local missing = vim.tbl_filter(function(lang)
                return not installed[lang]
            end, ensure)

            if #missing > 0 then
                treesitter.install(missing)
            end
        else
            vim.notify(
                "treesitter: `tree-sitter` CLI not found, parsers will not be installed",
                vim.log.levels.WARN
            )
        end

        local indent_langs = {
            bash = true,
            javascript = true,
            lua = true,
            python = true,
            templ = true,
        }

        local group = vim.api.nvim_create_augroup("BatraTreesitter", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)

                local ft = vim.bo[args.buf].filetype
                if ft == "markdown" then
                    vim.bo[args.buf].syntax = "ON"
                end

                if indent_langs[ft] then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end
}
