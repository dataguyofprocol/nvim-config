return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
        vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff (file)" })
        vim.keymap.set("n", "<leader>gD", "<cmd>Git diff<CR>", { desc = "Git diff (repo)" })
        vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>", { desc = "Git stage file" })
        vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>", { desc = "Git revert file" })
        vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
        vim.keymap.set("n", "<leader>gC", "<cmd>Git commit --amend<CR>", { desc = "Git commit amend" })
        vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
        vim.keymap.set("n", "<leader>gP", "<cmd>Git pull --rebase<CR>", { desc = "Git pull --rebase" })
        vim.keymap.set("n", "<leader>gf", "<cmd>Git push --force-with-lease<CR>", { desc = "Git push --force-with-lease" })
        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", { desc = "Git push upstream" })
        vim.keymap.set("n", "<leader>gri", "<cmd>Git rebase -i<CR>", { desc = "Git rebase interactive" })

        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Git use ours (//2)" })
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Git use theirs (//3)" })
    end,
}
