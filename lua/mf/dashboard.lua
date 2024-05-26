local db = require('dashboard')
-- vim.g.dashboard_default_executive ='telescope'
db.custom_header = {
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

-- vim.g.dashboard_custom_shortcut_icon['last_session'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
-- vim.g.dashboard_custom_shortcut_icon['find_file'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['new_file'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['find_word'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['book_marks'] = ' '

-- vim.g.dashboard_custom_shortcut={
-- \ 'last_session'       : 'SPC s l',
-- \ 'find_history'       : 'SPC f h',
-- \ 'find_file'          : 'SPC f f',
-- \ 'new_file'           : 'SPC c n',
-- \ 'change_colorscheme' : 'SPC t c',
-- \ 'find_word'          : 'SPC f a',
-- \ 'book_marks'         : 'SPC f b',
-- \ }


-- vim.g.dashboard_custom_section = {
--   a = {description = {'  Find File          '}, command = 'Telescope find_files'},
--   d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
--   b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
--   e = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.lua'}
-- }
--
-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
    { icon = ' ',
        desc = 'Find File',
        shortcut = '',
        action = 'Telescope find_files' },
    { icon = ' ',
        desc = 'Search Text',
        action = 'Telescope live_grep',
        shortcut = '' },
    { icon = ' ',
        desc = 'Recent Files',
        action = 'Telescope oldfiles',
        shortcut = '' },
    { icon = ' ',
        desc = 'Config',
        action = 'edit ~/.config/nvim/init.lua',
        shortcut = '' },
}

















