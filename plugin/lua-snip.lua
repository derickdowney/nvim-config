vim.pack.add({
    'https://github.com/saghen/blink.lib',
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saghen/blink.cmp',
})

-- Configure Blink completion.
local cmp = require('blink.cmp')
cmp.build():pwait()

cmp.setup({
    cmdline = {
        enabled = true,
        completion = {
            menu = {
                auto_show = true, -- Set to true to pop up automatically
            },
            list = {
                selection = {
                    preselect = false,
                },
            },
        },
    },
    completion = {
        documentation = {
            auto_show = true,
        },
        list = {
            selection = {
                preselect = false,
            },
        },
    },
    snippets = {
        preset = 'luasnip',
    },

    keymap = {
        preset = "none",

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        ["<CR>"] = { "accept", "fallback" },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})

-- Configure LuaSnip and load VS Code snippets.
local snippet_dir = [[C:\Users\ddowney\AppData\Local\nvim\snippets]]
local vscode_loader = require("luasnip.loaders.from_vscode")
local ls = require("luasnip")

-- Load friendly-snippets.
vscode_loader.lazy_load()

-- Load custom snippets registered in package.json.
vscode_loader.load({
    paths = { snippet_dir },
})

-- Open an fzf-lua picker containing current-filetype and global snippets.
local function pick_snippets()
    local ft = vim.bo.filetype
    local snippets = {}

    for _, group in ipairs({ ft, "all" }) do
        for _, snip in ipairs(ls.get_snippets(group) or {}) do
            local trigger = snip.trigger or "(no trigger)"
            local name = snip.name or trigger
            local label = trigger .. " — " .. name

            if not snippets[label] then
                snippets[label] = snip
            end
        end
    end

    local labels = {}
    for label in pairs(snippets) do
        table.insert(labels, label)
    end
    table.sort(labels)

    if #labels == 0 then
        vim.notify(
            "No snippets loaded for " .. ft .. " or all",
            vim.log.levels.WARN
        )
        return
    end

    require("fzf-lua").fzf_exec(labels, {
        prompt = "Snippets (" .. ft .. ")> ",
        actions = {
            ["default"] = function(selected)
                local snip = selected and snippets[selected[1]]
                if not snip then
                    return
                end

                -- Expand the chosen snippet in Insert mode.
                vim.schedule(function()
                    vim.cmd.startinsert()
                    vim.schedule(function()
                        ls.snip_expand(snip)
                    end)
                end)
            end,
        },
    })
end

-- Register the picker command and keymap.
vim.api.nvim_create_user_command("SnippetPicker", pick_snippets, {})

vim.keymap.set("n", "<leader>fs", "<cmd>SnippetPicker<cr>", {
    desc = "Fuzzy search snippets",
})



-- Insert CM comment snippet.
local function insert_cm_snippet(prefix)
    for _, snip in ipairs(ls.get_snippets("cm") or {}) do
        if snip.trigger == prefix or snip.trig == prefix then
            ls.snip_expand(snip)
            return
        end
    end

    vim.notify("Snippet not found: " .. prefix, vim.log.levels.WARN)
end

vim.keymap.set("n", "<C-M-S>", function()
    insert_cm_snippet("derick-comment")
end, { desc = "Insert CM comment snippet" })

vim.keymap.set("n", "<C-M-A>", function()
    insert_cm_snippet("derick-area-comment")
end, { desc = "Insert CM area comment snippet" })

vim.keymap.set("i", "<C-M-S>", function()
    vim.schedule(function()
        insert_cm_snippet("derick-comment")
    end)
end, { desc = "Insert CM comment snippet" })

vim.keymap.set("i", "<C-M-A>", function()
    vim.schedule(function()
        insert_cm_snippet("derick-area-comment")
    end)
end, { desc = "Insert CM area comment snippet" })

-- Make Tab jump to the next tabstop.
vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if ls.jumpable(1) then
        ls.jump(1)
    else
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
            "n",
            false
        )
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- Insert CM print line hit snippet.
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("cm", {
    s("derick-print-line-hit", {
        f(function()
            local line = vim.fn.line(".")
            local path = vim.fn.expand("%:p")

            -- Double all backslashes.
            path = path:gsub("\\", "\\\\")

            return string.format(
                'pln(spnn("\\n" # %d # " - ", #:function.name, "(..) - %s:%d").ehb',
                line,
                path,
                line
            )
        end),

        i(1, "pink"),

        f(function()
            return ' # " ");pln(cm.basic.popFace());'
        end),
    }),
})

vim.keymap.set({ "n", "i" }, "<C-M-P>", function()
    vim.schedule(function()
        insert_cm_snippet("derick-print-line-hit")
    end)
end, { desc = "Insert CM print line hit" })
