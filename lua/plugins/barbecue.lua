return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	lazy = false,
	config = function()
		require("barbecue").setup({
			create_autocmd = false, -- prevent barbecue from updating itself automatically
			attach_navic = true, -- prevent barbecue from automatically attaching nvim-navic

			exclude_filetypes = { "netrw", "toggleterm" },

			modifiers = {
				---Filename modifiers applied to dirname.
				dirname = ":~:.",

				---Filename modifiers applied to basename.
				basename = "",
			},

			---Whether to display path to file.
			show_dirname = true,

			---Whether to display file name.
			show_basename = true,

			---Whether to replace file icon with the modified symbol when buffer is modified.
			show_modified = false,

			---Get modified status of file.
			---
			---NOTE: This can be used to get file modified status from SCM (e.g. git)
			---
			---@type fun(bufnr: number): boolean
			modified = function(bufnr)
				return vim.bo[bufnr].modified
			end,

			---Whether to show/use navic in the winbar.
			show_navic = true,

			theme = "auto",

			---Whether context text should follow its icon's color.
			context_follow_icon_color = false,

			symbols = {
				---Modification indicator.
				modified = "●",
				---Truncation indicator.
				ellipsis = "…",
				---Entry separator.
				separator = "",
			},

			---Icons for different context entry kinds.
			kinds = {
				File = "",
				Module = "",
				Namespace = "",
				Package = "",
				Class = "",
				Method = "",
				Property = "",
				Field = "",
				Constructor = "",
				Enum = "",
				Interface = "",
				Function = "",
				Variable = "",
				Constant = "",
				String = "",
				Number = "",
				Boolean = "",
				Array = "",
				Object = "",
				Key = "",
				Null = "",
				EnumMember = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		})

		vim.api.nvim_create_autocmd({
			"WinResized", -- WinScrolled or WinResized on NVIM-v0.9 and higher
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",

			-- include this if you have set `show_modified` to `true`
			-- "BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
