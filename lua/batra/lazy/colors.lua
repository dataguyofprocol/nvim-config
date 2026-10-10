return {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            sidebars = "dark",
            floats = "dark",
        },
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
