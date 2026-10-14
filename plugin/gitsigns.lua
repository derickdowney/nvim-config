vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" }
})

local signs = require("gitsigns")

signs.setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 0,
    }
})

vim.keymap.set("n", "]c", function()
    signs.next_hunk()
end, {
    desc = "Jump to next hunk"
})

vim.keymap.set("n", "[c", function()
    signs.prev_hunk()
end, {
    desc = "Jump to previous hunk"
})
