return {
    -- Autosave
    {
        "okuuva/auto-save.nvim",
        enabled = true,
        version = '^1.0.0',                       -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
        cmd = "ASToggle",                         -- optional for lazy loading on command
        event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        config = function()
            -- some recommended exclusions. you can use `:lua print(vim.bo.filetype)` to
            -- get the filetype string of the current buffer
            local excluded_filetypes = {
                -- this one is especially useful if you use neovim as a commit message editor
                "gitcommit",
                -- most of these are usually set to non-modifiable, which prevents autosaving
                -- by default, but it doesn't hurt to be extra safe.
                "NvimTree",
                "Outline",
                "TelescopePrompt",
                "alpha",
                "dashboard",
                "lazygit",
                "neo-tree",
                "oil",
                "prompt",
                "toggleterm",
            }
            local excluded_filenames = {}

            require("auto-save").setup(

                {
                    enabled = true,                                                            -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
                    trigger_events = {                                                         -- See :h events
                        immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
                        defer_save = { "InsertLeave", "TextChanged" },                         -- vim events that trigger a deferred save (saves after `debounce_delay`)
                        cancel_deferred_save = { "InsertEnter" },                              -- vim events that cancel a pending deferred save
                    },
                    -- function that takes the buffer handle and determines whether to save the current buffer or not
                    -- return true: if buffer is ok to be saved
                    -- return false: if it's not ok to be saved
                    -- if set to `nil` then no specific condition is applied
                    condition = function(buf)
                        if vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype"))
                            or vim.tbl_contains(excluded_filenames, vim.fn.expand("%:t"))
                        then
                            return false
                        end
                        return true
                    end,
                    write_all_buffers = true, -- write all buffers when the current one meets `condition`
                    noautocmd = false,         -- do not execute autocmds when saving
                    lockmarks = false,        -- lock marks when saving, see `:h lockmarks` for more details
                    debounce_delay = 1000,    -- delay after which a pending save is executed
                    -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
                    debug = false,
                })
        end,
    },
    -- {
    --     "Pocco81/auto-save.nvim",
    --     lazy = false,
    --     enabled = false,

    --     config = function()
    --         require("auto-save").setup({
    --             enabled = true,          -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    --             execution_message = {
    --                 message = function() -- message to print on save
    --                     return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    --                 end,
    --                 dim = 0.18,                                    -- dim the color of `message`
    --                 cleaning_interval = 1250,                      -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    --             },
    --             trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
    --             -- function that determines whether to save the current buffer or not
    --             -- return true: if buffer is ok to be saved
    --             -- return false: if it's not ok to be saved
    --             condition = function(buf)
    --                 local fn = vim.fn
    --                 local utils = require("auto-save.utils.data")

    --                 local name = vim.api.nvim_buf_get_name(0)
    --                 if not name then
    --                     vim.print("ERROR: The buffer name is invalid")
    --                 end

    --                 if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
    --                     -- Note: The name is harpoon-menu but '-' is a special char so '.' expands to that char
    --                     if string.find(name, "harpoon.menu") ~= nil then
    --                         return false   -- can't save
    --                     end
    --                     return true        -- met condition(s), can save
    --                 end
    --                 return false           -- can't save
    --             end,
    --             write_all_buffers = false, -- write all buffers when the current one meets `condition`
    --             debounce_delay = 135,      -- saves the file at most every `debounce_delay` milliseconds
    --             callbacks = {
    --                 -- functions to be executed at different intervals
    --                 enabling = nil,              -- ran when enabling auto-save
    --                 disabling = nil,             -- ran when disabling auto-save
    --                 before_asserting_save = nil, -- ran before checking `condition`
    --                 before_saving = nil,         -- ran before doing the actual save
    --                 after_saving = nil,          -- ran after doing the actual save
    --             },
    --         })
    --     end,
    -- }
}
