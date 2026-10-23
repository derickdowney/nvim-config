vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
})


vim.lsp.enable({

    -- "ty" is a typesafe Python LSP created by Astral (people behind uv)
    'ty',   -- also $ pixi global install ty
    -- "ruff" is a Python linter/formatter also created by Astral
    'ruff', -- also $ pixi global install ruff

    -- "roslyn" is the dotnet language server
    'roslyn_ls',

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
                    -- Skip formatting if the filetype is "cm"
                    if vim.bo[ev.buf].filetype == 'cm' then
                        return
                    end
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})


-- Ruff was not formatting on save
-- This assumes the 'ruff' language server is already attached
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('my.lsp.fmt', { clear = true }),
    pattern = '*.py',
    callback = function(ev)
        vim.lsp.buf.format({
            bufnr = ev.buf,
            name = 'ruff',
            timeout_ms = 3000,
        })
    end,
})


-- GO TO `~/.config/nvim/plugins/fzf-lua.lua` to see keymaps for LSP

-- VARIABLE HIGHLIGHTING
-- When cursor stops, highlight all uses of the variable that cursor is on
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("lsp_document_highlight",
        { clear = true }
    ),
    pattern = "*",
    callback = function()
        -- Call "documentHighlight" if active LSP supports it
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client:supports_method("textDocument/documentHighlight") then
                vim.lsp.buf.document_highlight()
                break
            end
        end
    end,
})

-- When cursor moves, clear all LSP highlights
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = "lsp_document_highlight",
    pattern = "*",
    callback = function()
        -- Call "clearReferences" if active LSP supports it
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client:supports_method("textDocument/clearReferences") then
                vim.lsp.buf.clear_references()
                break
            end
        end
    end,
})

-- How long after cursor movement should highlight appear?
vim.o.updatetime = 250

-- Highlight coloring
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function()
--         local lsp_highlight_fg = "#FFFFFF"
--         local lsp_highlight_bg = "#000000"
--
--
--         vim.api.nvim_set_hl(0, "LspReferenceText", {
--             bg = lsp_highlight_bg,
--             fg = lsp_highlight_fg,
--             bold = true,
--         })
--
--         vim.api.nvim_set_hl(0, "LspReferenceRead", {
--             bg = lsp_highlight_bg,
--             fg = lsp_highlight_fg,
--             bold = true,
--         })
--
--         vim.api.nvim_set_hl(0, "LspReferenceWrite", {
--             bg = lsp_highlight_bg,
--             fg = lsp_highlight_fg,
--             bold = true,
--         })
--     end,
-- })
