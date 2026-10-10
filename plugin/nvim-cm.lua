-- If this is NOT a Windows computer, then return early (don't run this file)
if vim.fn.has("win32") == 0 then
    return
end

-- Add the CET CM Compiler support to Neovim
vim.pack.add({
    { src = "https://bitbucket.org/hni-it/nvim-cm/src/main/" , name = "nvim-cm" },
})

-- require("nvim-cm")
