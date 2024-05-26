return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require('gitsigns').setup {
            signs                   = {
                add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            },
            signcolumn              = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir            = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked     = true,
            current_line_blame      = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
        }
    end
}
