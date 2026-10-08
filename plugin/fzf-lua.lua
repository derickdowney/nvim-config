vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", function()
    fzf.files()
end)

vim.keymap.set("n", "<leader>fh", function()
    fzf.help_tags()
end)

vim.keymap.set("n", "<leader>fb", function()
    fzf.buffers()
end)

vim.keymap.set("n", "<leader>fk", function()
    fzf.builtin()
end)

vim.keymap.set("n", "<leader>fg", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("%:p:h")
    })
end)

vim.keymap.set("n", "<leader>fl", function()
    fzf.live_grep()
end)








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
