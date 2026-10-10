-- Disable arrow keys 😭 in Normal and Insert modes
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Set "spacebar" as leader key
vim.g.mapleader = " "

-- Map <space>e to :Explore
-- Use `ctrl + ^` to switch back to last buffer (which started :Explore)
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")

----------------------------------------
-- Windows keymappings (Neovim "windows", not the Windows OS)
----------------------------------------

-- Allow <leader> to control windows
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<cr>", {
    desc = "Go to the left window"
})
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<cr>", {
    desc = "Go to the down window"
})
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<cr>", {
    desc = "Go to the up window"
})
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<cr>", {
    desc = "Go to the right window"
})

-- Allow <leader> to control horizontal/vertical splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", {
    desc = "Split window"
})
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", {
    desc = "Split window vertically"
})
