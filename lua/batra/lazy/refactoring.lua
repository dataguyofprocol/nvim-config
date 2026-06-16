return
{
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "lewis6991/async.nvim",
    },
    config = function()
        require("refactoring").setup()
        vim.keymap.set({ "n", "x" }, "<leader>rr", function() require('refactoring').select_refactor() end
        )
    end,
}
