return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			-- Add a space b/w comment and the line
			padding = true,
			-- Whether the cursor should stay at its position
			sticky = true,
			-- Lines to be ignored while (un)comment
			ignore = "^$",
			-- LHS of toggle mappings in NORMAL mode
			toggler = {
				-- For convience i swaped the line and block mode.
				-- Line-comment toggle keymap
				line = "gcc",
				-- Block-comment toggle keymap
				block = "gbc",
			},
			-- LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				-- For convience i swaped the line and block mode.
				-- Line-comment keymap
				line = "gc",
				-- Block-comment keymap
				block = "gb",
			},
			-- LHS of extra mappings
			extra = {
				-- Add comment on the line above
				above = "gcO",
				-- Add comment on the line below
				below = "gco",
				-- Add comment at the end of line
				eol = "gcA",
			},
			-- Enable keybindings
			-- NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				-- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				-- Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			-- Function to call before (un)comment
			pre_hook = function(ctx)
				-- For inlay hints
				local line_start = (ctx.srow or ctx.range.srow) - 1
				local line_end = ctx.erow or ctx.range.erow
				require("lsp-inlayhints.core").clear(0, line_start, line_end)

				require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

				if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
					local U = require("Comment.utils")

					-- Determine whether to use linewise or blockwise commentstring
					local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

					-- Determine the location where to calculate commentstring from
					local location = nil
					if ctx.ctype == U.ctype.blockwise then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end

					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = type,
						location = location,
					})
				end
			end,

			-- Function to call after (un)comment
			post_hook = nil,
		})
	end,
}
