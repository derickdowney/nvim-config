vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")


fzf.setup({
    winopts = {
        height  = 0.95, -- window height
        width   = 0.90, -- window width
        preview = {
            layout   = 'vertical',
            vertical = "down:30%",
        }
    },
    keymap = {
        builtin = {
            ["<C-d>"] = 'preview-half-page-down',
            ["<C-u>"] = 'preview-half-page-up',
        },
    },
    files = {
        formatter = 'path.filename_first',
    },
    -- grep = {
    --     rg_opts = table.concat({
    --         "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
    --         "--colors 'path:none'",
    --         "--colors 'line:none'",
    --         "--colors 'column:none'",
    --         "--colors 'match:fg:225,255,229'",
    --         "-e",
    --     }, " "),
    -- },
})

-- "pookie's" personal setup
-- from: https://github.com/vossenwout/pookie-dotfiles/blob/main/neovim/.config/nvim/init.lua
-- fzf.setup({
-- 	fzf_colors = false,
-- 	grep = {
-- 		rg_opts = table.concat({
-- 			"--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
-- 			"--colors 'path:none'",
-- 			"--colors 'line:none'",
-- 			"--colors 'column:none'",
-- 			"--colors 'match:fg:225,255,229'",
-- 			"-e",
-- 		}, " "),
-- 	},
-- 	ui_select = true,
-- 	keymap = {
-- 		builtin = {
-- 			["<C-d>"] = 'preview-page-down', -- Better scrolling within the displays
-- 			["<C-u>"] = 'preview-page-up',
-- 		},
-- 	},
-- 	winopts = {
-- 		height  = 0.95, -- window height
-- 		width   = 0.90, -- window width
-- 		preview = {
-- 			layout   = 'vertical',
-- 			vertical = "down:30%",
-- 		}
-- 	},
-- 	files = {
-- 		formatter = 'path.filename_first',
-- 	},
-- })
--

vim.keymap.set("n", "<leader><space>", function()
    fzf.global({
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search VS Code style"
})

vim.keymap.set("n", "<leader>ff", function()
    fzf.files({
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search files"
})

vim.keymap.set("n", "<leader>fh", function()
    fzf.help_tags()
end, {
    desc = "Fuzzy search help tags"
})

vim.keymap.set("n", "<leader>fb", function()
    fzf.buffers()
end, {
    desc = "Fuzzy search buffers"
})

vim.keymap.set("n", "<leader>fk", function()
    fzf.builtin()
end, {
    desc = "Fuzzy search built-ins"
})

vim.keymap.set("n", "<leader>fg", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("%:p:h")
    })
end, {
    desc = "Fuzzy search project grep"
})

vim.keymap.set("n", "<leader>fl", function()
    fzf.live_grep()
end, {
    desc = "Fuzzy search live grep"
})

vim.keymap.set("n", "<leader>fc", function()
    fzf.files({
        cwd = vim.fn.stdpath('config')
    })
end, {
    -- vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua colorschemes<cr>", {
    desc = 'Pick colorscheme'
})

vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>", {
    desc = "Fuzzy search resume"
})

-- LSP Keybindings
vim.keymap.set('n', 'grr', fzf.lsp_references, {
    desc = 'References'
})
vim.keymap.set('n', 'gri', fzf.lsp_implementations, {
    desc = 'Implementations'
})
vim.keymap.set('n', 'gra', fzf.lsp_code_actions, {
    desc = 'Code actions'
})
vim.keymap.set('n', 'gd', fzf.lsp_definitions, {
    desc = 'Go to definition'
})







-- fzf.global() -- VS Code experience

-- vim.keymap.set("n", "<leader>ff", function()
--     fzf.files({
--         -- query = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":~:.") .. "/",
--     })
--     -- fzf.files({
--     --     -- % = current buffer
--     --     -- p = get absolute filepath
--     --     -- h = remove header filename from filepath
--     --     -- cwd = vim.fn.expand('%:p:h'),
--     -- })
-- end)
