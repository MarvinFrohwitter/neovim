local opts = { silent = true, noremap = true }

local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({
-- 	cmd = "lazygit",
-- 	dir = "git_dir",
-- 	direction = "float",
-- 	float_opts = {
-- 		border = "single",
-- 	},
-- 	-- function to run on opening the terminal
-- 	on_open = function(term)
-- 		vim.cmd("startinsert!")
-- 		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
-- 	end,
-- 	-- function to run on closing the terminal
-- 	on_close = function(term)
-- 		vim.cmd("startinsert!")
-- 	end,
-- })

-- function _lazygit_toggle()
-- 	lazygit:toggle()
-- end

-- vim.keymap.set({ "x", "v", "n" }, "<leader><leader>a", "<cmd>lua _lazygit_toggle()<CR>", opts)

vim.keymap.set("t", "<leader>ä", "<cmd> ToggleTermToggleAll<CR>", opts)
vim.keymap.set({ "x", "v", "n" }, "<leader>ä", "<cmd> ToggleTerm<CR>", opts)
vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end, opts)
vim.keymap.set("n", "<leader>dt", "<cmd>Trouble diagnostics toggle<CR>", opts)
vim.keymap.set("n", "<leader>ql", "<cmd>Trouble loclist toggle<CR>", opts)
vim.keymap.set("n", "<leader>qf", "<cmd>Trouble qflist toggle<CR>", opts)
vim.keymap.set("n", "<leader>gR", "<cmd>Trouble lsp_references toggle<CR>", opts)
vim.keymap.set("n", "<leader>ls", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)
-- vim.keymap.set("n", "<leader>o", "<cmd>Trouble symbols toggle focus=false<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>LLPStartPreview<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>mm", "<cmd>MarkdownPreviewToggle<CR>", opts)

-- For commenting
vim.keymap.set({ "n", "x" }, "<leader>gcc", ":norm gbc<CR>", opts)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- NvimTree
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

vim.keymap.set("n", "<leader>x", function()
	local neogit = require("neogit")
	if neogit.status.is_open() then
		neogit.close()
	else
		neogit.open()
	end
end, opts)

-- Just works for single line movement
vim.keymap.set({ "v" }, "<A-j>", "<cmd>move +1<CR><ESC>V", opts)
vim.keymap.set({ "v" }, "<A-k>", "<cmd>move -2<CR><ESC>V", opts)
-- vim.keymap.set("v", "J", "<cmd>move '>+1<CR>gv-gv", opts)
-- vim.keymap.set("v", "K", "<cmd>move '<-2<CR>gv-gv", opts)

-- better movement in terminal windows
local terminal_opts = { silent = true }
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", terminal_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", terminal_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", terminal_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", terminal_opts)

-- Save with Ctrl + S
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Delete the visual selection into the void register
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")

--Indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Copy to system clippboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- Paste from system clippboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')

-- Clear highlight search
vim.keymap.set({ "v", "n" }, "<leader>nh", "<cmd>nohlsearch<CR>")

vim.api.nvim_set_keymap("n", "<leader><leader>n", ":ASToggle<CR>", opts)

-- Local list
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<CR>")
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>lnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>lprev<CR>")

-- Quickfix list
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>")
vim.keymap.set("n", "<C-N>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-P>", "<cmd>cprev<CR>")

-- Open local diagnostics in local list
vim.keymap.set("n", "<leader>D", "<Cmd>lua vim.diagnostic.setqflist()<CR>")

-- Move around windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Switch buffers (needs nvim-bufferline)
vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")

-- Popualte substitution
vim.keymap.set("n", "<leader>s", "<cmd>s//g<Left><Left>")
vim.keymap.set("n", "<leader>S", "<cmd>%s//g<Left><Left>")
vim.keymap.set("n", "<leader><C-s>", "<cmd>%s//gc<Left><Left><Left>")

vim.keymap.set("v", "<leader>s", "<cmd>%s//g<Left><Left>")
vim.keymap.set("v", "<leader>S", "<cmd>%s//gc<Left><Left><Left>")

-- Telescope
local builtins = require('telescope.builtin')
vim.keymap.set("n", "<leader>fh", builtins.help_tags, opts)
vim.keymap.set("n", "<leader>fg", builtins.live_grep, opts)
vim.keymap.set("n", "<leader>fw", builtins.grep_string, opts)
vim.keymap.set("n", "<leader>fb", builtins.buffers, opts)
vim.keymap.set("n", "<leader>fo", builtins.oldfiles, opts)
vim.keymap.set("n", "<leader>fk", builtins.keymaps, opts)
vim.keymap.set("n", "<leader>fn", "<cmd>new<cr>", opts)

vim.keymap.set("n", "<leader>ff", function()
	vim.api.nvim_command("Telescope find_files")
end, opts)

vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
vim.keymap.set("n", "<leader>gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
vim.keymap.set("n", "<leader>gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
vim.keymap.set("n", "<leader>gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
vim.keymap.set("n", "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)

-- Show line diagnostics
-- vim.keymap.set("n","<leader><leader>k", "<Cmd>lua vim.diagnostic.open_float()<CR>")
