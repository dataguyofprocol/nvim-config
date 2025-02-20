return {
    'Vigemus/iron.nvim',

    config = function()
        local iron = require("iron.core")

        iron.setup {
            config = {
                scratch_repl = true,
                repl_definition = {
                    sh = {
                        command = { "zsh" }
                    },
                    python = {
                        command = { "python3" },
                        -- command = { "ipython", "--no-autoindent" },
                        format = require("iron.fts.common").bracketed_paste_python
                    }
                },
                repl_open_cmd = require('iron.view').right(0.45),

            },
            keymaps = {
                send_motion = "<space>jc",
                visual_send = "<space>jc",
                send_file = "<space>jf",
                send_line = "<space>jl",
                send_paragraph = "<space>sp",
                interrupt = "<space>si",
                exit = "<space>sq",
                clear = "<space>cl",
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true,
        }

        -- vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
        -- vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
        -- vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
        -- vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
    end
}
