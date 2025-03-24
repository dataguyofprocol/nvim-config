local prompts = {
    Explain = "Please explain how the following code works.",
    Review = "Please review the following code and provide suggestions for improvement.",
    Tests = "Please explain how the selected code works, then generate unit tests for it.",
    Refactor = "Please refactor the following code to improve its clarity and readability.",
    FixCode = "Please fix the following code to make it work as intended.",
    FixError = "Please explain the error in the following text and provide a solution.",
    BetterNamings = "Please provide better names for the following variables and functions.",
    Docstrings = "Please provide docstrings for the following code.",
}

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
        { "nvim-lua/plenary.nvim" },
        { "github/copilot.vim" },
    },
    opts = {
        question_header = "## User ",
        answer_header = "## Copilot ",
        error_header = "## Error ",
        prompts = prompts,
        auto_follow_cursor = false, -- Don't follow the cursor after getting response
        mappings = {
            -- Use tab for completion
            complete = {
                detail = "Use @<Tab> or /<Tab> for options.",
                insert = "<Tab>",
            },
            -- Close the chat
            close = {
                normal = "q",
                insert = "<C-c>",
            },
            -- Reset the chat buffer
            reset = {
                normal = "<C-r>",
                insert = "<C-r>",
            },
            -- Submit the prompt to Copilot
            submit_prompt = {
                normal = "<CR>",
                insert = "<C-CR>",
            },
            -- Accept the diff
            accept_diff = {
                normal = "<C-y>",
                insert = "<C-y>",
            },
            -- Show help
            show_help = {
                normal = "?",
            },
        },
    },
    config = function(_, opts)
        local chat = require("CopilotChat")
        chat.setup(opts)

        local select = require("CopilotChat.select")
        vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
            chat.ask(args.args, { selection = select.visual })
        end, { nargs = "*", range = true })

        -- Inline chat with Copilot
        vim.api.nvim_create_user_command("CopilotChatInline", function(args)
            chat.ask(args.args, {
                selection = select.visual,
                window = {
                    layout = "float",
                    relative = "cursor",
                    width = 1,
                    height = 0.4,
                    row = 1,
                },
            })
        end, { nargs = "*", range = true })

        -- Restore CopilotChatBuffer
        vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
            chat.ask(args.args, { selection = select.buffer })
        end, { nargs = "*", range = true })

        -- Custom buffer for CopilotChat
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "copilot-*",
            callback = function()
                vim.opt_local.relativenumber = true
                vim.opt_local.number = true

                -- Get current filetype and set it to markdown if the current filetype is copilot-chat
                local ft = vim.bo.filetype
                if ft == "copilot-chat" then
                    vim.bo.filetype = "markdown"
                end
            end,
        })
    end,
    event = "VeryLazy",
    keys = {
        -- Use consistent prefix for all Copilot commands (cc for "Copilot Chat")
        {
            "<leader>cc",
            function()
                local actions = require("CopilotChat.actions")
                require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
            end,
            desc = "CopilotChat - Prompt actions",
        },
        {
            "<leader>cc",
            ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
            mode = "x",
            desc = "CopilotChat - Prompt actions",
        },
        -- Inline chat with visual selection
        {
            "<leader>ci",
            ":CopilotChatInline<cr>",
            mode = "x",
            desc = "CopilotChat - Inline chat",
        },
        -- Visual selection chat in vertical split
        {
            "<leader>cv",
            ":CopilotChatVisual<cr>",
            mode = "x",
            desc = "CopilotChat - Open in vertical split",
        },
        -- Ask with input prompt
        {
            "<leader>cp",
            function()
                local input = vim.fn.input("Ask Copilot: ")
                if input ~= "" then
                    vim.cmd("CopilotChat " .. input)
                end
            end,
            desc = "CopilotChat - Ask with prompt",
        },
        { "<leader>cx", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
        { "<leader>cq", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle chat window" },
    }
}
