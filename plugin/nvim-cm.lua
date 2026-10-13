-- If this is NOT a Windows computer, then return early (don't run this file)
if vim.fn.has("win32") == 0 then
    return
end

-- Add the CET CM Compiler support to Neovim
vim.pack.add({
    {
        src = "https://bitbucket.org/hni-it/nvim-cm.git",
        name = "nvim-cm"
    },
})

require("cm").setup({
        lint = false,
        -- lint_disable = 'format-required,format-indentation,paren-content-spacing,keyword-spacing,binary-operator-spacing,function-call-spacing,bracket-spacing,file-spacing,class-spacing',
})
