vim.pack.add({
    -- { src = "https://github.com/joshdick/onedark.vim" },
    { src = "https://github.com/navarasu/onedark.nvim" },
})


-- vim.cmd.colorscheme(('onedark')) -- originally used for joshdick's onedark


-- 1. Initialize the plugin with your default style
require('onedark').setup({
    style = 'darker', -- or 'warmer', 'deep', etc.
})
require('onedark').load()


-- 2. Create function to update highlight for vim.lsp.buf.document_highlight()
local function update_lsp_highlight(is_dark)
    local lsp_highlight_fg = "#FFFFFF"
    local lsp_highlight_bg = "#000000"

    if is_dark then
        lsp_highlight_fg = "#000000"
        lsp_highlight_bg = "#FFFFFF"
    end

    vim.api.nvim_set_hl(0, "LspReferenceText", {
        bg = lsp_highlight_bg,
        fg = lsp_highlight_fg,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "LspReferenceRead", {
        bg = lsp_highlight_bg,
        fg = lsp_highlight_fg,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "LspReferenceWrite", {
        bg = lsp_highlight_bg,
        fg = lsp_highlight_fg,
        bold = true,
    })
end


-- 3. Create a toggle function
local is_dark = true
update_lsp_highlight(is_dark)

local function toggle_theme()
    is_dark = not is_dark

    if is_dark then
        require('onedark').setup({ style = 'darker' })
        print("Switched to Dark mode")
    else
        require('onedark').setup({ style = 'light' })
        print("Switched to Light mode")
    end

    require('onedark').load()
    update_lsp_highlight(is_dark)
end


-- 3. Bind it to a keymap (e.g., Space + u + t for "UI Theme")
vim.keymap.set('n', '<leader>ct', toggle_theme, {
    desc = 'Toggle light/dark theme'
})
