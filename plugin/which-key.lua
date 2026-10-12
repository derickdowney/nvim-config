vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" }
})

require("which-key").setup({
    -- preset = "helix", -- Keeping standard since you can see full descriptions
    keys = {
        scroll_down = "<PageDown>",
        scroll_up = "<PageUp>",
    },
    -- win = {
    --     height = { min = 1, max = 5 }, -- Limit popup height to 5 items
    -- },
})

vim.keymap.set( "n", "<leader>?", function()
    require("which-key").show({ global = false })
end, {
    desc = "Buffer Local Keymaps (which-key)"
})
