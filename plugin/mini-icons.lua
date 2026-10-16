vim.pack.add({ 'https://github.com/nvim-mini/mini.icons' })

-- My Windows laptop doesn't support nerd font icons apparently
if vim.fn.has("win32") == 0 then
    require('mini.icons').setup({
        style = 'ascii',
    })
end
