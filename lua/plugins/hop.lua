return {
	"smoka7/hop.nvim",
	version = "*",
	lazy = false,

	config = function()
		local status_ok, hop = pcall(require, "hop")
		if not status_ok then
			return
		end
		hop.setup({
			case_insensitive = true,
			keys = "abcdefghijklmnopqrstuvxyz",
			uppercase_labels = false,
			multi_windows = true,
		})

		local opts = { noremap = true, silent = true }
		local directions = require("hop.hint").HintDirection

		vim.keymap.set("", "L", ":HopWordCurrentLine<cr>", { silent = true })
		-- vim.keymap.set("", "S", ":HopChar2<cr>", { silent = true })
		-- vim.keymap.set("", "Q", ":HopPattern<cr>", { silent = true })
		vim.keymap.set("", "H", ":HopChar2<cr>", { silent = true })

		vim.keymap.set("o", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, opts)
		vim.keymap.set("o", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, opts)
		vim.keymap.set("o", "t", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, opts)
		vim.keymap.set("o", "T", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, opts)
		vim.keymap.set("n", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, opts)
		vim.keymap.set("n", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, opts)
		vim.keymap.set("n", "t", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, opts)
		vim.keymap.set("n", "T", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, opts)

		vim.keymap.set("o", "m", "<cmd><C-U>lua require('tsht').nodes()<CR>", { silent = true })
		vim.keymap.set("x", "m", "<cmd>lua require('tsht').nodes()<CR>", { noremap = true, silent = true })
	end,
}
