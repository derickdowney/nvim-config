vim.pack.add({
    { src = "https://github.com/esmuellert/codediff.nvim" }
})

require("codediff").setup({
    highlights = {
        line_insert = "#214228", -- Medium-dark forest green
        line_delete = "#4e2828", -- Medium-dark wine red
        char_brightness = 1.5,
    }
})

-- vim.keymap.set("n", "<leader>gd", ":CodeDiff<cr>", {
--     desc = "Execute CodeDiff",
-- })


vim.keymap.set('n', '<leader>gdd', '<cmd>CodeDiff<cr>', {
    desc = 'Code diff not staged'
})
vim.keymap.set('n', '<leader>gdm', '<cmd>CodeDiff main<cr>', {
    desc = 'Code diff against main'
})
vim.keymap.set('n', '<leader>gdh', '<cmd>CodeDiff HEAD~1<cr>', {
    desc = 'Code diff against previous commit'
})

vim.api.nvim_create_autocmd("User", {
    pattern = "CodeDiffOpen",
    callback = function()
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            vim.wo[win].cursorline = false
        end
    end,
})
