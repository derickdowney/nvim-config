vim.pack.add({
    -- { src = "https://github.com/joshdick/onedark.vim" },
    { src = "https://github.com/navarasu/onedark.nvim" },
})


-- vim.cmd.colorscheme(('onedark')) -- originally used for joshdick's onedark


-- 1. Initialize the plugin with your default style
require('onedark').setup({
    style = 'dark', -- or 'warmer', 'deep', etc.
})
require('onedark').load()


-- 2. Create a toggle function
local is_dark = true

local function toggle_theme()
    is_dark = not is_dark

    if is_dark then
        require('onedark').setup({ style = 'dark' })
        print("Switched to Dark mode")
    else
        require('onedark').setup({ style = 'light' })
        print("Switched to Light mode")
    end

    require('onedark').load()
end


-- 3. Bind it to a keymap (e.g., Space + u + t for "UI Theme")
vim.keymap.set('n', '<leader>ct', toggle_theme, {
    desc = 'Toggle light/dark theme'
})
