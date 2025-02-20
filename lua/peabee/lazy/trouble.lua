return {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
        modes = {
            lsp = {
                win = { position = 'right' },
            },
        },
    },
    event = 'VeryLazy',
    icons = false,
    warn_no_results = false,
    --	stylua: ignore
    keys = {
        { '<Leader>tT', '<cmd>Trouble diagnostics toggle<CR>',              desc = 'Diagnostics (Trouble)' },
        { '<Leader>tt', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer Diagnostics (Trouble)' },
        { '<leader>tL', '<cmd>Trouble loclist toggle<cr>',                  desc = 'Location List (Trouble)' },
        { '<leader>tQ', '<cmd>Trouble qflist toggle<cr>',                   desc = 'Quickfix List (Trouble)' },

        {
            '[t',
            function()
                if require('trouble').is_open() then
                    require('trouble').previous({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = 'Previous Trouble/Quickfix Item',
        },
        {
            ']t',
            function()
                if require('trouble').is_open() then
                    require('trouble').next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = 'Next Trouble/Quickfix Item',
        },
    },
}
