-- Show absolute number of current line
vim.opt.nu = true

-- Show relative numbers of non-current lines
vim.opt.relativenumber = true

-- Show color line at column 80
vim.opt.colorcolumn = "80"

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
  eol = " ", --"↲",
}

----------------------------------------
-- Derick config for vertical/horizontal split borders
----------------------------------------
vim.opt.fillchars = {
  horiz = '-',
  horizup = '┻',
  horizdown = '┳',
  vert = '¦',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

-- All split windows share one single status line at bottom
-- vim.opt.laststatus = 3 -- lualine "globalstatus" overrides this

