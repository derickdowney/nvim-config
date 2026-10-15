vim.pack.add({
    { src = "https://github.com/voldikss/vim-floaterm" }
})

-- vim.keymap.set("n", "<leader>tn", ":FloatermNew<cr>", {
--     desc = "Create new floating terminal"
-- })
vim.keymap.set("n", "<C-t><C-t>", "<cmd>FloatermToggle<cr>", {
    -- vim.keymap.set("n", "<leader>t", "<cmd>FloatermToggle<cr>", {
    desc = "Toggle last floating terminal"
})

-- :tnoremap <C-\><C-\> <C-\><C-n> -- This is what the "vim" keymap looks like
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n><cmd>FloatermToggle<cr>", {
    desc = "Escape terminal insert mode"
})
