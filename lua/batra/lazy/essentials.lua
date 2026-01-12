return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            local comment = require("Comment")
            comment.setup({})
        end
    },
    {
        "VonHeikemen/fine-cmdline.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim"
        },
        lazy = false,
        config = function()
            local cmdline = require("fine-cmdline")
            cmdline:setup()

            vim.keymap.set("n", ":", '<cmd>lua require("fine-cmdline").open({default_value = ""})<CR>',
                { noremap = true, silent = true })
        end
    },
    -- { "github/copilot.vim" },
    {
        "Exafunction/windsurf.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                enable_cmp_source = false, -- Disable cmp source for inline mode
                virtual_text = {
                    enabled = true,
                    manual = false,
                    prefix = "󰘦 ",
                },
            })
        end
    },
}
