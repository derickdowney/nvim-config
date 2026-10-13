vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")

fzf.setup({
    keymap = {
        builtin = {
            ["<C-d>"] = 'preview-half-page-down',
            ["<C-u>"] = 'preview-half-page-up',
        },
    },
})

vim.keymap.set("n", "<leader>ff", function()
    fzf.files()
end, {
    desc = "Fuzzy search files"
})

vim.keymap.set("n", "<leader>fh", function()
    fzf.help_tags()
end, {
    desc = "Fuzzy search help tags"
})

vim.keymap.set("n", "<leader>fb", function()
    fzf.buffers()
end, {
    desc = "Fuzzy search buffers"
})

vim.keymap.set("n", "<leader>fk", function()
    fzf.builtin()
end, {
    desc = "Fuzzy search built-ins"
})

vim.keymap.set("n", "<leader>fg", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("%:p:h")
    })
end, {
    desc = "Fuzzy search project grep"
})

vim.keymap.set("n", "<leader>fl", function()
    fzf.live_grep()
end, {
    desc = "Fuzzy search live grep"
})

vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua colorschemes<cr>", {
    desc = 'Pick colorscheme'
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

-- vim.keymap.set("n", "<leader>ff", function()
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
