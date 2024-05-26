-- vim.cmd([[set foldmethod=manual]])
vim.opt.updatetime = 200
vim.opt.undofile = true
vim.opt.timeout = false
vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
-- vim.opt.mousemodel = "popup"
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.smartcase = true
-- vim.cmd([[set wildmode=list:full]])
vim.cmd([[set wildmode=full]])
vim.cmd([[set cc=80]])
vim.cmd([[filetype plugin indent on]])
vim.opt.linebreak = true
vim.cmd([[syntax on]])
vim.opt.clipboard:append("unnamedplus")
vim.opt.cursorline = true
vim.opt.ttyfast = true
-- vim.opt.backupdir = '~/.cache/nvim/backup'
-- vim.opt.laststatus = 3
vim.opt.spell = true
vim.opt.spelllang = { "en", "de" }
-- vim.cmd([[highlight WinSeparator guibg=None]])
vim.opt.winbar = "%=%m %f"
-- vim.opt.cmdheight = 0
vim.opt.wrap = true
vim.opt.winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"
-- vim.opt.winhighlight = "NormalFloat:PmenuThumb,NormalFloat:PmenuThumb,CursorLine:PmenuSel,Search:None"
