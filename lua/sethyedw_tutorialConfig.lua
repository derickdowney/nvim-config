----------------------------------------
-- All of these configs were taken from
-- https://www.youtube.com/watch?v=XQuNoprFW38&t=857s
----------------------------------------
vim.g.netrw_banner = 0 -- disable netrw display banner at top
vim.opt.smartindent = true -- vim will guess indent of next line
vim.opt.inccommand = "split" -- when :%s substitute, open split preview window
vim.opt.splitbelow = true -- when split called, split new to bottom
vim.opt.splitright = true -- when vsplit called, split new to right
vim.opt.scrolloff = 8 -- scroll buffer so cursor is minimum 8 lines from edge

-- vim.opt.ignorecase = true -- no case-sensitivity if all lowercase search term
-- vim.opt.smartcase = true -- case-sensitivity is any uppercase in search

-- disable swapfiles and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- enable "undo file" which stores all undos in a persistent file
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
-- see this location with
    -- :echo stdpath("data")
    -- :lua print(vim.fn.stdpath("data"))
-- for me this is: /Users/derick/.local/share/nvim/undodir/
-- on Windows it's: C:\Users\ddowney\AppData\Local\nvim-data
vim.opt.undofile = true

-- vim.opt.clipboard:append("unnamedplus") -- always copy to system clipboard
-- vim.opt.isfname:append("@-@") -- allow filenames with "@" characters
-- vim.opt.guicursor = "" -- allow OS to control cursor instead of Neovim?
vim.opt.signcolumn = "yes" -- add extra column to far left for signs, diag, etc.

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.opt.termguicolors = true -- enables truecolor 24-bit support for Neovim


----------------------------------------
-- Keymaps
----------------------------------------


-- vim.keymap.set("x", "p", [["_dP]], {
--     desc = "Paste over selection without losing yanked text
-- })
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {
--     desc = "Delete without yanking"
-- })
-- vim.keymap.set("i", "<C-c>", "<Esc>") -- Escape insert mode with Ctrl-c


vim.keymap.set("n", "<C-c>", "<cmd>nohl<cr>") -- Clear highlighting


-- Move currently selected lines
    -- 1. Press <M-Down>  ──>  2. Execute :m '>+1  ──>  3. Press gv  ──>  4. Press =  ──>  5. Press gv
    -- (Triggers map)          (Moves lines down)       (Reselects)       (Re-indents)    (Keeps selection active)
vim.keymap.set("v", "<M-Down>", ":m '>+1<cr>gv=gv", {
    desc = "Move currently-selected lines up"
})
vim.keymap.set("v", "<M-Up>", ":m '<-2<cr>gv=gv", {
    desc = "Move currently-selected lines down"
})


-- Indent/unindent and keep selection
vim.keymap.set("v", "<", "<gv", {
    desc = "Unindent then restore last selection"
})
vim.keymap.set("v", ">", ">gv", {
    desc = "Indent then restore last selection"
})


-- Join lines without moving cursor
    -- Mark cursor location to name "z", join lines, jump to mark z
    -- "z" is often used as a "temporary mark" for scripts/keymaps
vim.keymap.set("n", "J", "mzJ`z", {
    desc = "Join lines without moving cursor"
})


-- Keep cursor centered when moving up/down in buffer
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- LEFT OFF AT 10 minutes and 0 seconds!!!!
