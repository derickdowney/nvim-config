vim.pack.add({
    'https://github.com/saghen/blink.lib',
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/saghen/blink.cmp',
})

local cmp = require('blink.cmp')

cmp.build()
-- cmp.build():pwait()

cmp.setup({
    completion = {
        documentation = {
            auto_show = true,
        },
        list = {
            selection = {
                preselect = false,
            },
        },
    },
})
