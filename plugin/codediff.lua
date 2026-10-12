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

vim.keymap.set("n", "<leader>gd", ":CodeDiff<cr>", {
    desc = "Execute CodeDiff",
})
