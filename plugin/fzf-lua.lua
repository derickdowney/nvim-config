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
})

vim.keymap.set("n", "<leader><space><space>", function()
    fzf.global({
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search VS Code style"
})

vim.keymap.set("n", "<leader>fff", function()
    fzf.files({
        cwd = vim.fn.expand("%:p:h")
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search files in current buffer's directory"
})

vim.keymap.set("n", "<leader>ff.", function()
    fzf.files({
        cwd = vim.fn.expand(".")
        -- cwd = "C:\\CetDev\\dev\\extensions\\custom\\"
    })
end, {
    desc = "Fuzzy search files in current working directory"
})

vim.keymap.set("n", "<leader>ffb", function()
    fzf.files({
        cwd = vim.fn.expand("../../../base")
    })
end, {
    desc = "Fuzzy search files in Configura's base directory"
})

vim.keymap.set("n", "<leader>ffc", function()
    fzf.files({
        cwd = vim.fn.stdpath('config')
    })
end, {
    desc = 'Fuzzy search nvim config'
})

vim.keymap.set("n", "<leader>ffp", function()
    fzf.files({
        cwd = "/users/derick/projects/",
    })
end, {
    desc = 'Fuzzy search projects folder'
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

vim.keymap.set("n", "<leader>fgg", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("%:p:h")
    })
end, {
    desc = "Fuzzy grep from current buffer's directory"
})

vim.keymap.set("n", "<leader>fg.", function()
    fzf.grep_project({
        search_paths = vim.fn.expand(".")
    })
end, {
    desc = "Fuzzy grep from current working directory"
})

vim.keymap.set("n", "<leader>fgb", function()
    fzf.grep_project({
        search_paths = vim.fn.expand("../../../base")
    })
end, {
    desc = "Fuzzy grep from Configura base directory"
})

vim.keymap.set("n", "<leader>fgp", function()
    fzf.grep_project({
        search_paths = "/users/derick/projects/",
    })
end, {
    desc = "Fuzzy grep from projects folder"
})

vim.keymap.set("n", "<leader>fgc", function()
    fzf.grep_project({
        search_paths = vim.fn.stdpath('config')
    })
end, {
    desc = "Fuzzy grep from Configura base directory"
})

vim.keymap.set("n", "<leader>fl", function()
    fzf.live_grep_glob({
        search_paths = vim.fn.expand(".")
    })
end, {
    desc = "Fuzzy live grep from current window directory"
})

-- vim.keymap.set("n", "<leader>ft", function()
--     fzf.treesitter({
--         -- cwd = vim.fn.stdpath('config')
--     })
-- end, {
--     desc = 'Fuzzy search treesitter symbols'
-- })
--
vim.keymap.set("n", "<leader>cc", "<cmd>FzfLua colorschemes<cr>", {
    desc = "Pick colorscheme"
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


-- TREESITTER AND CM TREESITTER
local function cm_symbols()
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()

    local ok, parser = pcall(vim.treesitter.get_parser, buf, "cm")
    if not ok or not parser then
        vim.notify(
            "Could not load the cm Tree-sitter parser",
            vim.log.levels.ERROR
        )
        return
    end

    local query_ok, query = pcall(vim.treesitter.query.get, "cm", "tags")
    if not query_ok or not query then
        vim.notify(
            "Could not load the cm tags query",
            vim.log.levels.ERROR
        )
        return
    end

    local trees = parser:parse()
    if not trees or not trees[1] then
        vim.notify("Could not parse cm buffer", vim.log.levels.ERROR)
        return
    end

    -- Display settings.
    local NAME_WIDTH = 38
    local KIND_WIDTH = 14

    local function fit(text, width)
        text = tostring(text or "")
        local display_width = vim.fn.strdisplaywidth(text)

        if display_width > width then
            -- Leave room for the ellipsis.
            local truncated = ""
            for _, char in ipairs(vim.fn.strchars(text) > 0
                and vim.fn.split(text, "\\zs") or {}) do
                if vim.fn.strdisplaywidth(truncated .. char .. "…") > width then
                    break
                end
                truncated = truncated .. char
            end
            text = truncated .. "…"
            display_width = vim.fn.strdisplaywidth(text)
        end

        return text .. string.rep(" ", math.max(0, width - display_width))
    end

    local entries = {}

    for _, match in query:iter_matches(trees[1]:root(), buf) do
        local def, name, def_kind

        for id, nodes in pairs(match) do
            local cap = query.captures[id]

            if cap == "name" then
                name = nodes[1]
            elseif cap and cap:find("^definition%.") then
                def = nodes[1]
                def_kind = cap:sub(12)
            end
        end

        if def and name then
            local sr, sc = def:start()
            local name_text = vim.treesitter.get_node_text(name, buf)

            -- Format the visible columns independently of navigation data.
            local kind_text = def_kind or "definition"
            local location = string.format("%5d:%-3d", sr + 1, sc + 1)

            table.insert(entries, string.format(
                "%s\t%s\t%s",
                fit(name_text, NAME_WIDTH),
                fit(kind_text, KIND_WIDTH),
                location
            ))
        end
    end

    if #entries == 0 then
        vim.notify(
            "No cm document symbols found",
            vim.log.levels.INFO
        )
        return
    end

    fzf.fzf_exec(entries, {
        prompt = "CM Symbols> ",

        -- Treat the tabs as real column separators.
        fzf_opts = {
            ["--delimiter"] = "\t",
            ["--with-nth"] = "1,2,3",
            ["--header"] = string.format(
                "%-" .. NAME_WIDTH .. "s  %-" .. KIND_WIDTH .. "s  %s",
                "SYMBOL",
                "KIND",
                "LINE:COL"
            ),
            ["--header-first"] = "",
            ["--layout"] = "reverse",
            ["--info"] = "inline",
            ["--border"] = "rounded",
            ["--no-multi"] = "",
        },

        actions = {
            ["default"] = function(selected)
                if not selected or not selected[1] then
                    return
                end

                -- The third tab-delimited field is the source location.
                local location = selected[1]:match(
                    "\t[^\t]*\t(%s*%d+:%d+)%s*$"
                )

                local line, col
                if location then
                    line, col = location:match("(%d+):(%d+)")
                end

                if not line or not col then
                    return
                end

                if not vim.api.nvim_buf_is_valid(buf)
                    or not vim.api.nvim_win_is_valid(win) then
                    return
                end

                -- Return to the original window and buffer.
                vim.api.nvim_set_current_win(win)

                if vim.api.nvim_win_get_buf(win) ~= buf then
                    vim.api.nvim_win_set_buf(win, buf)
                end

                line = math.min(
                    tonumber(line),
                    vim.api.nvim_buf_line_count(buf)
                )

                -- Tree-sitter columns are zero-based internally.
                col = math.max(0, tonumber(col) - 1)

                local line_text = vim.api.nvim_buf_get_lines(
                    buf, line - 1, line, false
                )[1] or ""

                col = math.min(col, #line_text)

                vim.api.nvim_win_set_cursor(win, { line, col })
                vim.cmd("normal! zz")
            end,
        },
    })
end
-- local function cm_symbols()
--     local buf = vim.api.nvim_get_current_buf()
--     local win = vim.api.nvim_get_current_win()
--
--     local ok, parser = pcall(vim.treesitter.get_parser, buf, "cm")
--     if not ok or not parser then
--         vim.notify("Could not load the cm Tree-sitter parser", vim.log.levels.ERROR)
--         return
--     end
--
--     local query = vim.treesitter.query.get("cm", "tags")
--     if not query then
--         vim.notify("Could not load the cm tags query", vim.log.levels.ERROR)
--         return
--     end
--
--     local trees = parser:parse()
--     if not trees or not trees[1] then
--         vim.notify("Could not parse cm buffer", vim.log.levels.ERROR)
--         return
--     end
--
--     local entries = {}
--
--     for _, match in query:iter_matches(trees[1]:root(), buf) do
--         local def, name, def_kind
--
--         for id, nodes in pairs(match) do
--             local cap = query.captures[id]
--
--             if cap == "name" then
--                 name = nodes[1]
--             elseif cap:find("^definition%.") then
--                 def = nodes[1]
--                 def_kind = cap:sub(12)
--             end
--         end
--
--         if def and name then
--             local sr, sc = def:start()
--             local name_text = vim.treesitter.get_node_text(name, buf)
--
--             -- Keep line and column at the end so the selection
--             -- handler can recover the definition's location.
--             table.insert(entries, string.format(
--                 "%s\t%s\t%d:%d",
--                 name_text,
--                 def_kind,
--                 sr + 1,
--                 sc + 1
--             ))
--         end
--     end
--
--     if #entries == 0 then
--         vim.notify("No cm document symbols found", vim.log.levels.INFO)
--         return
--     end
--
--     fzf.fzf_exec(entries, {
--         prompt = "CM Symbols> ",
--         fzf_opts = {
--             ["--delimiter"] = "\t",
--         },
--         actions = {
--             ["default"] = function(selected)
--                 if not selected or not selected[1] then
--                     return
--                 end
--
--                 local line, col = selected[1]:match("\t(%d+):(%d+)$")
--                 if not line or not col then
--                     return
--                 end
--
--                 if not vim.api.nvim_buf_is_valid(buf)
--                     or not vim.api.nvim_win_is_valid(win) then
--                     return
--                 end
--
--                 -- Return to the original window and buffer.
--                 vim.api.nvim_set_current_win(win)
--                 if vim.api.nvim_win_get_buf(win) ~= buf then
--                     vim.api.nvim_win_set_buf(win, buf)
--                 end
--
--                 line = math.min(tonumber(line), vim.api.nvim_buf_line_count(buf))
--                 col = tonumber(col) - 1
--
--                 vim.api.nvim_win_set_cursor(win, { line, col })
--                 vim.cmd("normal! zz")
--             end,
--         },
--     })
-- end
--
vim.keymap.set("n", "<leader>ft", function()
    if vim.bo.filetype == "cm" then
        -- Use your custom nvim-cm document-symbol picker.
        cm_symbols()
    else
        -- Preserve the normal Fzf-Lua behavior for every other filetype.
        fzf.treesitter({
            -- cwd = vim.fn.stdpath('config')
        })
    end
end, {
    desc = "Fuzzy search treesitter symbols",
})
