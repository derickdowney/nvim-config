-- Disable arrow keys 😭 in Normal and Insert modes
vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>")

-- Set "spacebar" as leader key
vim.g.mapleader = " "

-- Map <space>e to :Explore
-- Use `ctrl + ^` to switch back to last buffer (which started :Explore)
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")
