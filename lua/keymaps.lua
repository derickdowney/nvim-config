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

----------------------------------------
-- Windows keymappings (Neovim "windows", not the Windows OS)
----------------------------------------

-- Allow <leader> to control windows
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<cr>")

-- Allow <leader> to control horizontal/vertical splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>")
