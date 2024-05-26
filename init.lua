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
    let g:vimtex_view_method          = 'zathura'
    let g:vimtex_view_general_viewer  = 'evince'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    let g:vimtex_compiler_method      = 'latexrun'
    let g:livepreview_previewer       = 'zathura'
    let g:livepreview_engine          = 'pdflatex'
    let g:livepreview_use_biber       = 1
]])

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


