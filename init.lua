vim.g.mapleader          = " "
vim.g.maplockalleader    = " "
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("baseconfig")
require("lazyinit")
require("keymaps")
require("autoexec")

require("init")

vim.cmd([[
    if !exists('g:undotree_WindowLayout')
        let g:undotree_WindowLayout = 2
    endif
]])

vim.cmd([[
    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif
]])


