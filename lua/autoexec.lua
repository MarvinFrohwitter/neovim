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

--  creates the command to change the spelllang for cmp
vim.api.nvim_create_user_command("SwitchLang", function(args)
	vim.opt.spelllang = args.args
	vim.api.nvim_command("CmpDictionaryUpdate")
end, { nargs = 1 })

vim.api.nvim_create_augroup("buildNote", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { group = "buildNote", pattern = "*note-*.md", command = "!buildNote %:p" })

-- vim.api.nvim_create_augroup("formatwrite", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = "formatwrite",
-- 	callback = function()
-- 		local save_cursor = vim.fn.getpos(".")
-- 		vim.lsp.buf.format()
-- 		print("WRITE FORMAT")
-- 		vim.fn.setpos(".", save_cursor)
-- 	end,
-- })

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

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		if 1 == #wins - #floating_wins - #tree_wins then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(tree_wins) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})
