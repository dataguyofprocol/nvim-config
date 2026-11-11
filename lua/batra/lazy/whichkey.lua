return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- Helix-style: compact hint popup at the bottom instead of the big grid
        preset = "helix",
        -- Show the popup immediately on <leader> instead of after a delay
        delay = 0,
        icons = {
            mappings = vim.g.have_nerd_font,
        },
        -- Labels for prefix groups whose keymaps live scattered across files
        spec = {
            { "<leader>g", group = "[G]it (fugitive)" },
            { "<leader>m", group = "[M]arkdown" },
            { "<leader>p", group = "[P]roject / find (telescope)" },
            { "<leader>v", group = "[V]iew LSP / diagnostics" },
        },
    },
}
