vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

-- Full list of supported languages built into this plugin:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
require('nvim-treesitter').install {
    'json',
}

vim.cmd('syntax off') -- Make it obvious if treesitter is missing

-- Start treesitter when file opens
vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})
