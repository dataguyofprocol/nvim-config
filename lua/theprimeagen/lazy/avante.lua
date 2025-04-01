return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
        cursor_applying_provider = "mistral",
        provider = "mistral",
        vendors = {
            mistral = {
                __inherited_from = "openai",
                endpoint = "https://codestral.mistral.ai/v1/",
                model = "codestral-latest",
                api_key_name = "CODESTRAL_API_KEY",
            }
        },
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
