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

-- LEFT OFF ON 5 minutes and 55 seconds
