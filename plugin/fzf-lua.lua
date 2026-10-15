vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")


fzf.setup({
    winopts = {
        height  = 0.95, -- window height
        width   = 0.90, -- window width
        preview = {
            layout   = 'vertical',
            vertical = "down:30%",
        }
    },
    keymap = {
        builtin = {
            ["<C-d>"] = 'preview-half-page-down',
            ["<C-u>"] = 'preview-half-page-up',
        },
    },
    files = {
        formatter = 'path.filename_first',
    },
})

vim.keymap.set("n", "<leader><space><space>", function()
    fzf.global({
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search VS Code style"
})

vim.keymap.set("n", "<leader><space>ff", function()
    fzf.files({
        cwd = vim.fn.expand("%:p:h")
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search files in current buffer's directory"
})

vim.keymap.set("n", "<leader><space>f.", function()
    fzf.files({
        cwd = vim.fn.expand(".")
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search files in current working directory"
})

vim.keymap.set("n", "<leader><space>fb", function()
    fzf.files({
        cwd = vim.fn.expand("../../../base")
    })
end, {
    desc = "Fuzzy search files in Configura's base directory"
})

vim.keymap.set("n", "<leader><space>fc", function()
    fzf.files({
        cwd = vim.fn.stdpath('config')
    })
end, {
    desc = 'Fuzzy search nvim config'
})

vim.keymap.set("n", "<leader><space>h", function()
    fzf.help_tags()
end, {
    desc = "Fuzzy search help tags"
})

vim.keymap.set("n", "<leader><space>b", function()
    fzf.buffers()
end, {
    desc = "Fuzzy search buffers"
})

vim.keymap.set("n", "<leader><space>k", function()
    fzf.builtin()
end, {
    desc = "Fuzzy search built-ins"
})

vim.keymap.set("n", "<leader><space>gg", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("%:p:h")
    })
end, {
    desc = "Fuzzy grep from current buffer's directory"
})

vim.keymap.set("n", "<leader><space>g.", function()
    fzf.grep_project({
        search_paths = vim.fn.expand(".")
    })
end, {
    desc = "Fuzzy grep from current working directory"
})

vim.keymap.set("n", "<leader><space>gb", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("../../../base")
    })
end, {
    desc = "Fuzzy grep from Configura base directory"
})

vim.keymap.set("n", "<leader><space>l", function()
    fzf.live_grep_glob({
        search_paths = vim.fn.expand(".")
    })
end, {
    desc = "Fuzzy live grep from current window directory"
})

vim.keymap.set("n", "<leader><space>t", function()
    fzf.treesitter({
        -- cwd = vim.fn.stdpath('config')
    })
end, {
    desc = 'Fuzzy search treesitter symbols'
})

vim.keymap.set("n", "<leader>cc", "<cmd>FzfLua colorschemes<cr>", {
    desc = "Pick colorscheme"
})

vim.keymap.set("n", "<leader><space>r", "<cmd>FzfLua resume<cr>", {
    desc = "Fuzzy search resume"
})

-- LSP Keybindings
vim.keymap.set('n', 'grr', fzf.lsp_references, {
    desc = 'References'
})
vim.keymap.set('n', 'gri', fzf.lsp_implementations, {
    desc = 'Implementations'
})
vim.keymap.set('n', 'gra', fzf.lsp_code_actions, {
    desc = 'Code actions'
})
vim.keymap.set('n', 'gd', fzf.lsp_definitions, {
    desc = 'Go to definition'
})







-- fzf.global() -- VS Code experience

-- vim.keymap.set("n", "<leader><space>f", function()
--     fzf.files({
--         -- query = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":~:.") .. "/",
--     })
--     -- fzf.files({
--     --     -- % = current buffer
--     --     -- p = get absolute filepath
--     --     -- h = remove header filename from filepath
--     --     -- cwd = vim.fn.expand('%:p:h'),
--     -- })
-- end)
