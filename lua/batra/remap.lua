vim.g.mapleader = " "

-- File navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw file explorer" })

-- Text manipulation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Navigation and scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Clipboard operations
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Mode switching
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })

-- Deliberate; don't remove.
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Utility mappings
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer (refuses unsaved changes)" })

-- Quickfix and location list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })

-- File operations
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
vim.keymap.set("n", "<leader>mp", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown render" })

-- Render the current markdown file with glow in a floating window (q to close)
vim.keymap.set("n", "<leader>rm", function()
    if vim.bo.filetype ~= "markdown" then
        vim.notify("Not a markdown file", vim.log.levels.WARN)
        return
    end
    if vim.fn.executable("glow") ~= 1 then
        vim.notify("glow is not installed. Install it with: brew install glow", vim.log.levels.ERROR)
        return
    end

    local file = vim.fn.expand("%:p")
    -- Match glow's wrap width (-w) to the float interior: border + padding = 4
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].bufhidden = "wipe"

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        row = math.floor((vim.o.lines - height) / 2) - 1,
        col = math.floor((vim.o.columns - width) / 2),
        width = width,
        height = height,
        border = "rounded",
        style = "minimal",
    })

    local close = function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end
    -- q from normal mode; if you exit glow's pager itself, the window closes too
    vim.keymap.set("n", "q", close, { buffer = buf, desc = "Close markdown render" })
    vim.keymap.set("n", "<Esc>", close, { buffer = buf, desc = "Close markdown render" })

    vim.fn.termopen({ "glow", "-p", "-w", tostring(width - 4), file }, { on_exit = close })
    vim.cmd.startinsert()
end, { desc = "Render Markdown (glow)" })

-- Line operations
vim.keymap.set('n', '<Leader>o', 'o<Esc>0"_D', { noremap = true, desc = "Insert blank line below" })
vim.keymap.set('n', '<Leader>O', 'O<Esc>0"_D', { noremap = true, desc = "Insert blank line above" })

vim.keymap.set("n", "<leader>?", function()
    local cheatsheet = vim.fn.expand("~/.config/nvim/keybindings-cheatsheet.md")
    vim.cmd("vsplit " .. vim.fn.fnameescape(cheatsheet))
end, { desc = "Open keybindings cheatsheet" })
