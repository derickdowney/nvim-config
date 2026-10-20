vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

local custom_ts_path = vim.fs.joinpath(
    vim.fn.stdpath('data'),
    'site',
    'pack',
    'core',
    'opt',
    'nvim-cm'
)

-- Make parser/cm.dll discoverable by Neovim.
vim.opt.runtimepath:prepend(custom_ts_path)

-- Map the filetype to the parser language.
vim.treesitter.language.register('cm', { 'cm' })

-- Detect *.cm files as the cm filetype.
vim.filetype.add({
    extension = {
        cm = 'cm',
    },
})

if vim.fn.has('win32') == 1 then
    vim.api.nvim_create_autocmd('User', {
        pattern = 'TSUpdate',
        callback = function()
            require('nvim-treesitter.parsers').cm = {
                install_info = {
                    path = custom_ts_path,
                    location = 'parser',
                    generate = false,
                    generate_from_json = false,
                    queries = 'queries/neovim',
                },
            }
        end,
    })
end
-- -- if Windows computer, add parser/cm.dll path to runtime
-- if vim.fn.has("win32") then
--     vim.api.nvim_create_autocmd('User', {
--         pattern = 'TSUpdate',
--         callback = function()
--             require('nvim-treesitter.parsers').cm = {
--                 install_info = {
--                     path = vim.fs.joinpath(vim.fn.stdpath('data'), 'site', 'pack', 'core', 'opt', 'nvim-cm'),
--                     -- optional entries
--                     location = 'parser',
--                     generate = true,
--                     generate_from_json = false,
--                     queries = 'queries/neovim', -- symlink queries from given directory
--                 },
--             }
--         end
--     })
--     -- local custom_ts_path = vim.fs.joinpath(vim.fn.stdpath('data'), 'site', 'pack', 'core', 'opt', 'nvim-cm')
--     -- vim.opt.runtimepath:append(custom_ts_path)
--     --
--     -- vim.filetype.add({
--     --     extension = {
--     --         cm = 'cm', -- Maps *.cm files to the 'cm' filetype
--     --     },
--     -- })
-- end
--

-- Full list of supported languages built into this plugin:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
require('nvim-treesitter').install {
    'json',
    'python',
    'c_sharp',
    'xml',
}

vim.cmd('syntax off') -- Make it obvious if treesitter is missing

-- Start treesitter when file opens
vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})
