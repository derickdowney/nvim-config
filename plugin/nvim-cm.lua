-- If this is NOT a Windows computer, then return early (don't run this file)
if vim.fn.has("win32") == 0 then
    return
end

-- Add the CET CM Compiler support to Neovim
vim.pack.add({
    {
        src = "https://bitbucket.org/hni-it/nvim-cm.git",
        name = "nvim-cm",
    },
})

require("cm").setup({
    lint = false,
    lint_disable =
    'format-required,format-indentation,paren-content-spacing,keyword-spacing,binary-operator-spacing,function-call-spacing,bracket-spacing,file-spacing,class-spacing',
})

vim.keymap.set({ "n", "i" }, "<C-M-S-F8>", "<esc>:CmStart<cr>")
vim.keymap.set({ "n", "i" }, "<C-M-S-F1>", "<esc>:CmClean<cr>")
vim.keymap.set({ "n", "i" }, "<C-M-Y>", "<esc>:CmClear<cr>:CmLoadAll<cr>")
vim.keymap.set({ "n", "i" }, "<C-M-U>", "<esc>:CmLoad<cr>")
vim.keymap.set({ "n", "i" }, "<C-M-p>", "<esc>:CmRun<cr>")
vim.keymap.set({ "n", "i" }, "<M-t>", "<esc>:CmClear<cr>")
vim.keymap.set({ "n", "i" }, "<M-o>", "<esc>:CmOverrides<cr>")
vim.keymap.set({ "n", "i" }, "<C-M-S-F5>", "<esc>:CmEval custom.kimballinternational.kimInt.kimIntDevClear();<cr>")
vim.keymap.set({ "n", "i" }, "<C-M-E>", "<esc>:CmEval cm.runtime.enableDeprecatedErrors(false);<cr>")


vim.keymap.set("n", "<C-M-S-F12>", function()
    vim.fn.jobstart(
        "start https://bitbucket.org/hni-it/kii-cet-extension/pull-requests/new",
        {
            detach = true,
        })
end, {
    desc = "Create new Bitbucket pull request"
})
