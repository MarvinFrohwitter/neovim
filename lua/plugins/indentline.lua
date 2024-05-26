return {
	-- indentline vertical lines for spaces
	"lukas-reineke/indent-blankline.nvim",


	config = function()
		vim.opt.list = true
		vim.opt.listchars:append("space:⋅")
		vim.opt.listchars:append("tab:⋅⋅⋅")
		-- vim.opt.listchars:append "eol:↴"

		-- require("indent_blankline").setup({
		-- 	space_char_blankline = " ",
		-- 	show_current_context = true,
		-- 	show_current_context_start = true,
		-- 	use_treesitter = true,
		-- })

		local status_ok, ibl = pcall(require, "ibl")
		if not status_ok then
			vim.notify("The indent blankline plugin faild to load!", nil)
			return
		end

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
		end)

		ibl.setup({
			indent = {
				highlight = {
					"RainbowRed",
					"RainbowYellow",
					"RainbowBlue",
					"RainbowOrange",
					"RainbowGreen",
					"RainbowViolet",
					"RainbowCyan",
				},
			},
		})
	end,
}
