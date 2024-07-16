function ColorMyPencils(color)
    local my_colors = { 'gruvbox', 'kanagawa', 'rose-pine', 'tokyonight' }
    local rand_color = color or my_colors[math.random(#my_colors)]
    print("Coloring My Pencils...", rand_color)
    vim.cmd.colorscheme(rand_color)
end

return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require('gruvbox').setup({
                styles = {
                    transparent_mode = true,
                    italic = {
                        strings = false,
                        comments = false,
                        folds = false,
                        operators = false,
                        emphasis = false,
                    }
                },
            })
        end
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        config = function()
            require('kanagawa').setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                theme = "lotus",
                background = {
                    dark = "dragon",
                    light = "lotus"
                }
            })
            -- vim.cmd("colorscheme kanagawa")
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
            ColorMyPencils()
        end
    },


}
