return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enabled = true,
            render_modes = true,
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)

            local group = vim.api.nvim_create_augroup("BatraMarkdownEditing", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = "markdown",
                callback = function(args)
                    vim.api.nvim_set_option_value("wrap", true, { win = vim.fn.bufwinid(args.buf) })
                    vim.api.nvim_set_option_value("linebreak", true, { win = vim.fn.bufwinid(args.buf) })
                    vim.api.nvim_set_option_value("spell", true, { win = vim.fn.bufwinid(args.buf) })
                    vim.api.nvim_set_option_value("colorcolumn", "", { win = vim.fn.bufwinid(args.buf) })
                end,
            })
        end,
    },
}
