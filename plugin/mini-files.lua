vim.pack.add({ 'https://github.com/nvim-mini/mini.files' })

local files = require('mini.files')

files.setup()

vim.keymap.set("n", "<leader>ee", function()
    files.open()
end, {
    desc = "Open cwd in mini files"
})

vim.keymap.set("n", "<leader>er", function()
    files.open(vim.api.nvim_buf_get_name(0), false)
end, {
    desc = "Reveal buffer's directory in mini files"
})


vim.keymap.set("n", "<leader>ec", function()
    files.open(vim.fn.stdpath('config'), false)
end, {
    desc = "Reveal buffer's directory in mini files"
})
