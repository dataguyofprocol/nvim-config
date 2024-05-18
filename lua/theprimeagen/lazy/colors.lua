function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

end

return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require('gruvbox').setup({
                styles = {
                    transparent_mode=false,
                    italic = {
                        strings=false,
                        comments= false,
                        folds= false,
                        operators=false,
                        emphasis=false,
                    }
                },
            })

            vim.cmd("colorscheme gruvbox")

            ColorMyPencils()
        end
    },


}
