----------------------------------------
-- Derick's Keymaps
----------------------------------------

-- Set "spacebar" as leader key
-- YOU HAVE TO DO THIS BEFORE CALLING <leader> ANYWHERE ELSE!
vim.g.mapleader = " "

-- Disable arrow keys 😭 in Normal and Insert modes
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Map <space>e to :Explore
-- Use `ctrl + ^` to switch back to last buffer (which started :Explore)
-- vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", {
--     desc = "Explore buffer's current directory"
-- })
-- vim.keymap.set("n", "<leader>ec", function()
--     vim.cmd.Explore(vim.fn.stdpath("config"))
-- end, {
--     desc = "Explore Neovim config directory"
-- })

-- Allow <leader> to control windows
vim.keymap.set("n", "<leader>ww", "<C-w><C-w>", {
    desc = "Go to another window"
})
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
vim.keymap.set("n", "<leader>wq", "<cmd>wincmd q<cr>", {
    desc = "Quit window"
})

-- Allow <leader> to control horizontal/vertical splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", {
    desc = "Split window"
})
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", {
    desc = "Split window vertically"
})


-- Delete current buffer and switch to previous buffer
-- Or technically, switch to previous, then delete the last active buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bp | bd #<cr>", {
    desc = "Delete current buffer and keep window"
})

----------------------------------------
-- Options
----------------------------------------

-- Show absolute number of current line
vim.opt.nu = true

-- Show relative numbers of non-current lines
vim.opt.relativenumber = true

-- Show color line at column 80
vim.opt.colorcolumn = "80"

-- Highlight current line
vim.opt.cursorline = true

-- Use 4 spaces for indents, as is Python's standard
vim.opt.tabstop = 4      -- Number of spaces that equals one <Tab>
vim.opt.shiftwidth = 4   -- Size of an indent
vim.opt.softtabstop = 4  -- Num of spaces equaling one <Tab> when editing
vim.opt.expandtab = true -- Convert tabs to spaces

-- Show all whitespaces but not end-of-lines
vim.opt.list = true
vim.opt.listchars = {
    tab = "▸ ",
    space = " ", -- "·"
    trail = "•",
    eol = " ",   --"↲",
}

-- Derick config for vertical/horizontal split borders
vim.opt.fillchars = {
    horiz = '-',
    horizup = '┻',
    horizdown = '┳',
    vert = '¦',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋',
}

-- Use rounded border for all floating windows by default
vim.o.winborder = "rounded"

-- All split windows share one single status line at bottom
-- vim.opt.laststatus = 3 -- lualine "globalstatus" overrides this


----------------------------------------
-- Options taken from "pookie's" tutorial
-- https://www.youtube.com/watch?v=BBCScVuP3xo
----------------------------------------
vim.o.confirm = true -- raise dialog if unsaved buffer

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,       -- Only rerun LSP after you exit Insert mode
    float = { source = 'if_many' }, -- "show multiple sources"
    jump = {
        on_jump = {
            float = true, -- When you ]d to next error, pop up error window
        },
    },
})

vim.keymap.set("n", "<leader>wd", vim.diagnostic.open_float, {
    desc = "Open diagnostics floating window"
})

-- Better command line movements
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<M-b>", "<S-Left>")
vim.keymap.set("c", "<M-f>", "<S-Right>")


----------------------------------------
-- Autocomplete
-- from: https://www.youtube.com/watch?v=s7zb73fgXqU
----------------------------------------
vim.o.autocomplete = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.keymap.set("i", "<Up>", "<C-p>")
vim.keymap.set("i", "<Down>", "<C-n>")
-- vim.opt.complete:append('o') -- append "omni-func" to autocomplete
-- vim.o.pumborder = 'rounded'
-- vim.o.pumheight = 5 -- limit to top 5 suggestions
-- Disable autocomplete for markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- Disable native autocomplete for this buffer
        vim.bo.omnifunc = ""
        -- If you want to completely turn off the auto-trigger flag locally:
        vim.opt_local.complete:remove('o')
    end,
})
