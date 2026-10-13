vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
})


vim.lsp.enable({
    -- "ty" is a Python LSP created by Astral (people behind uv)
    'ty',     -- also $ pixi global install ty

    'lua_ls', -- also $ pixi global install lua-language-server

    -- 'mojo',   -- this works if your pixi virtual environment is activated
})


vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    -- Lua Language Server doesn't recognize 'vim' as
                    -- a valid global by default and flags it with a warning.
                    -- This registers it as a global var which removes warning.
                    "vim"
                }
            }
        }
    }
})


-- Auto-format ("lint") on save (adapted from neovim docs :help auto-format)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp.fmt', { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})


-- GO TO `~/.config/nvim/plugins/fzf-lua.lua` to see keymaps for LSP
