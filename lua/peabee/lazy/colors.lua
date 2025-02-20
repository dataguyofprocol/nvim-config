function ColorMyPencils(color)
    math.randomseed(os.time())

    local my_colors = { 'gruvbox', 'kanagawa', 'tokyonight', 'rose-pine', 'brightburn' }
    local rand_color = color or my_colors[math.random(#my_colors)]
    print("Coloring My Pencils with...", rand_color)

    local success, err = pcall(vim.cmd.colorscheme, rand_color)
    if not success then
        print("Error setting colorscheme:", err)
        return
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
end

return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require('gruvbox').setup({
                transparent_mode = true,
                styles = {
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
                theme = "wave",
                transparent = true,
                background = {
                    dark = "dragon",
                    light = "lotus"
                }
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                dark_variant = "moon", -- Options: 'main', 'moon', 'dawn'
                disable_background = true,
                disable_float_background = true,
                highlight_groups = {
                    Normal = { bg = "NONE" },
                    NormalFloat = { bg = "NONE" },
                },
            })
        end
    },
    {
        "erikbackman/brightburn.vim",
        name = "brightburn",
        config = function()
            vim.g.brightburn_transparent_background = true
            ColorMyPencils()
        end
    },
}
