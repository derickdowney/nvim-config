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


-- Use <C-arrow> and <leader>arrow to navigate windows
vim.keymap.set({ "n", "t" }, "0w1", "<cmd>wincmd h<cr><cmd>wincmd k<cr>", {
    desc = "Go to left window"
})
vim.keymap.set({ "n", "t" }, "0w2", "<cmd>wincmd l<cr><cmd>wincmd k<cr>", {
    desc = "Go to right window"
})
vim.keymap.set({ "n", "t" }, "0w3", "<cmd>wincmd h<cr><cmd>wincmd j<cr>i", {
    desc = "Go to up window"
})
vim.keymap.set({ "n", "t" }, "0w4", "<cmd>wincmd l<cr><cmd>wincmd j<cr>", {
    desc = "Go to down window"
})

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
-- vim.keymap.set("n", "<leader>wy", "<cmd>wincmd h<cr><cmd>wincmd k<cr>", {
--     desc = "Go to the top-left window"
-- })
-- vim.keymap.set("n", "<leader>wn", "<cmd>wincmd h<cr><cmd>wincmd j<cr>", {
--     desc = "Go to the bottom-left window"
-- })
-- vim.keymap.set("n", "<leader>wo", "<cmd>wincmd l<cr><cmd>wincmd k<cr>", {
--     desc = "Go to the top-right window"
-- })
-- vim.keymap.set("n", "<leader>w.", "<cmd>wincmd l<cr><cmd>wincmd j<cr>", {
--     desc = "Go to the bottom-right window"
-- })
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
    update_in_insert = false,  -- Only rerun LSP after you exit Insert mode
    float = { source = true }, -- "show multiple sources"
    jump = { float = true, },  -- When you ]d to next error, pop up error window
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
-- Native Autocomplete --- DISABLED SO I CAN USE blink.cmp
-- from: https://www.youtube.com/watch?v=s7zb73fgXqU
----------------------------------------
-- vim.o.autocomplete = true
-- vim.opt.completeopt = { 'menuone', 'noselect', 'preview' }
-- vim.keymap.set("i", "<Up>", "<C-p>")
-- vim.keymap.set("i", "<Down>", "<C-n>")
-- vim.opt.complete:append('o') -- append "omni-func" to autocomplete
-- vim.o.pumborder = 'rounded'
-- vim.o.pumheight = 5          -- limit to top 5 suggestions
--
-- -- Disable autocomplete for markdown files
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "markdown",
--     callback = function()
--         -- Disable native autocomplete for this buffer
--         vim.bo.omnifunc = ""
--         -- If you want to completely turn off the auto-trigger flag locally:
--         vim.opt_local.complete:remove('o')
--     end,
-- })


----------------------------------------
-- Load session_keymaps.lua if they exist
----------------------------------------

vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        if vim.v.this_session ~= "" then
            -- Look for session_keymaps.lua in same directory as Session.vim
            local session_dir = vim.fn.fnamemodify(vim.v.this_session, ":h")
            local maps_file = session_dir .. "/session_keymaps.lua"

            if vim.fn.filereadable(maps_file) == 1 then
                -- Safely load and execute the Lua mapping file
                local ok, err = pcall(dofile, maps_file)
                if not ok then
                    vim.notify("Error loading session keymaps: " .. err, vim.log.levels.ERROR)
                else
                    vim.notify("Loaded session keymaps: " .. maps_file, vim.log.levels.INFO)
                end
            end
        end
    end,
})
