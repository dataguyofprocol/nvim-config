function ColorMyPencils(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end

return {
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     name = "gruvbox",
    --     config = function()
    --         require('gruvbox').setup({
    --             styles = {
    --                 transparent_mode=false,
    --                 italic = {
    --                     strings=false,
    --                     comments= false,
    --                     folds= false,
    --                     operators=false,
    --                     emphasis=false,
    --                 }
    --             },
    --         })
    --
    --         vim.cmd("colorscheme gruvbox")
    --
    --         ColorMyPencils()
    --     end
    -- },
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
            vim.cmd("colorscheme kanagawa")


            ColorMyPencils()
        end
    }


}
