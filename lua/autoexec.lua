-- jumps back to the old cursor position after reopen a file
vim.api.nvim_create_autocmd("BufRead", {
	callback = function(opts)
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			buffer = opts.buf,
			callback = function()
				local ft = vim.bo[opts.buf].filetype
				local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
				if
					not (ft:match("commit") and ft:match("rebase"))
					and last_known_line > 1
					and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
				then
					vim.api.nvim_feedkeys([[g`"]], "x", false)
				end
			end,
		})
	end,
})
-- lsp-inlayhints on on_attach
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "LspAttach_inlayhints",
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})

--  creates the comand to change the spelllang for cmp
vim.api.nvim_create_user_command("SwitchLang", function(args)
	vim.opt.spelllang = args.args
	vim.api.nvim_command("CmpDictionaryUpdate")
end, { nargs = 1 })

vim.api.nvim_create_augroup("buildNote", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { group = "buildNote", pattern = "*note-*.md", command = "!buildNote %:p" })

-- Remove trailing whitespaces
--  (if a file requires trailing spaces, exclude its type using the regex)
vim.api.nvim_create_augroup("whitespace", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = "whitespace",
	pattern = "*",
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Set options for markdown and gitcommit files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt.wrap = true
		vim.opt.spell = true
		vim.opt.foldenable = false
	end,
})

-- Disable  next line commenting
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 200,
		})
	end,
})

-- This is closing if nvim-tree is the last open buffer
local function tab_win_closed(winnr)
	local api = require("nvim-tree.api")
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w)
		return w ~= winnr
	end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else -- else closed buffer was normal buffer
		if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
				vim.schedule(function()
					if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
						vim.cmd("quit") -- then close all of vim
					else -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
					end
				end)
			end
		end
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true,
})
